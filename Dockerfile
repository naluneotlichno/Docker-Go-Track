FROM golang:1.23.0

WORKDIR /app

COPY . /app

RUN go get modernc.org/sqlite

RUN go build -o main .

# Создаем директорию для базы данных
RUN mkdir -p /data

# Устанавливаем путь к файлу базы данных через переменную окружения
ENV SQLITE_DB_FILE=/data/tracker.db

# Объявляем том для сохранения данных базы данных вне контейнера
VOLUME /data

# Команда для запуска приложения
CMD ["./main"]
