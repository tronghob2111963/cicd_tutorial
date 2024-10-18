FROM python:3.12-slim

LABEL maintainer="Trong Ho <Trongb2111963@student.ctu.edu.vn>"

# Cài đặt các package hệ thống cần thiết
RUN apt update -y && \
    apt install -y build-essential python3-venv && \
    apt clean && rm -rf /var/lib/apt/lists/*

# Đặt thư mục làm việc và thêm file ứng dụng
WORKDIR /flask_app
ADD . /flask_app

# Tạo virtual environment và đảm bảo pip được cài đặt
RUN python3 -m venv venv && \
    ./venv/bin/python -m ensurepip --upgrade && \
    ./venv/bin/python -m pip install --upgrade pip && \
    ./venv/bin/python -m pip install --break-system-packages -r requirements.txt

# Khai báo entrypoint và command để chạy ứng dụng Flask
ENTRYPOINT ["./venv/bin/python"]
CMD ["flask_docker.py"]

