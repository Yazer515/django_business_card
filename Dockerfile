# Используем официальный образ Python в качестве базового
FROM python:3.10

# Устанавливаем переменные окружения
ENV PYTHONUNBUFFERED 1

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /app

# Копируем все файлы проекта Django в контейнер
COPY . .

# Устанавливаем зависимости
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Открываем порт 80 для доступа к приложению
EXPOSE 80

RUN python landingpage/manage.py collectstatic --no-input

# запускаем Django сервер
CMD ["python", "landingpage/manage.py", "runserver", "0.0.0.0:80"]
