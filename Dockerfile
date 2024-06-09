# Используем базовый образ Python
FROM python:3.10-slim

# Установим рабочую директорию
WORKDIR /app

# Установим зависимости, включая binutils для objdump
RUN apt-get update && apt-get install -y binutils

# Скопируем requirements.txt и установим зависимости
COPY requirements.txt requirements.txt
RUN pip install --upgrade pip && pip install -r requirements.txt

# Установим PyInstaller
RUN pip install pyinstaller

# Скопируем весь проект в контейнер
COPY . .

# Соберем бинарный файл с помощью PyInstaller
RUN pyinstaller --onefile main.py

# Переместим бинарный файл в директорию release
RUN mkdir -p release && cp dist/main release/binaryfile

# Определим команду для запуска вашего приложения (при необходимости)
CMD ["./release/binaryfile"]
