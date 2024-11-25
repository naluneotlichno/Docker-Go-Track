FROM golang:1.23.0

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod tidy

COPY . .

RUN go build -o main .

# Устанавливаем путь к файлу базы данных через переменную окружения
ENV SQLITE_DB_FILE=/data/tracker.db

# Объявляем том для сохранения данных базы данных вне контейнера
VOLUME /data

# Команда для запуска приложения
CMD ["./main"]
