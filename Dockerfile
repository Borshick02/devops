# Используем официальный базовый образ Python
FROM python:3.10-slim

# Установим необходимые системные зависимости
RUN apt-get update && apt-get install -y \
    binutils \
    && rm -rf /var/lib/apt/lists/*

# Установим рабочую директорию
WORKDIR /app

# Скопируем и установим зависимости из requirements.txt
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Скопируем остальные файлы проекта в контейнер
COPY . /app

# Установим PyInstaller и соберем бинарный файл
RUN pip install pyinstaller && \
    pyinstaller --onefile main.py && \
    mkdir -p /app/release && \
    mv dist/main /app/release/main

# Команда по умолчанию для выполнения при запуске контейнера
CMD ["./release/main"]
