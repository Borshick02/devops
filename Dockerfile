
FROM python:3.10-slim


RUN apt-get update && apt-get install -y \
    binutils \
    && rm -rf /var/lib/apt/lists/*


WORKDIR /app


COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app


RUN pip install pyinstaller && \
    pyinstaller --onefile main.py && \
    mkdir -p /app/release && \
    mv dist/main /app/release/main

CMD ["./release/main"]
