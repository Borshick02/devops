# Базовый образ Python
FROM python:3.10-slim

# Установим зависимости
WORKDIR /app
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Скопируем остальные файлы
COPY . /app

# Соберем бинарный файл с помощью PyInstaller
RUN python -m pip install pyinstaller && \
    pyinstaller --onefile dvp.py && \
    mv dist/dvp /app/release/dvp

# Зададим команду по умолчанию
CMD ["./release/dvp"]
