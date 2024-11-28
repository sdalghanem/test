# Dockerfile
FROM python:3.9-slim

# تثبيت المتطلبات الأساسية
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev

# إعداد العمل
WORKDIR /app

# تثبيت المتطلبات
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# نسخ المشروع
COPY . .

# فتح المنفذ
EXPOSE 8000

# الأوامر النهائية
CMD ["gunicorn", "testproject.wsgi:application", "--bind", "0.0.0.0:8000"]
