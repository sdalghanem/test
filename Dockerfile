# setup server

# 1: start docker kernel + python
FROM python:3.9-slim-bullseye

# 2: ENV: show logs
ENV PYTHONUNBUFFERED=1

# 3: update kernel + install dependencies
RUN echo "deb http://deb.debian.org/debian bullseye main contrib non-free" >> /etc/apt/sources.list
RUN apt-get update && apt-get -y install gcc libpq-dev libmysqlclient-dev

# 4: create project folder: kernel
WORKDIR /app

# 5: Copy requirements
COPY requirements.txt /app/requirements.txt

# 6: install requirements
RUN pip install -r /app/requirements.txt

# 7: copy project code --> docker
COPY . /app/

# 8: collect static files
RUN python manage.py collectstatic --noinput

# 9: set the command to run the app
CMD ["gunicorn", "testproject.wsgi:application", "--bind", "0.0.0.0:8000"]
