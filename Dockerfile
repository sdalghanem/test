# اختيار الصورة الأساسية
FROM python:3.9-slim

# إعداد مسار العمل
WORKDIR /app

# تثبيت المتطلبات
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# نسخ المشروع
COPY . /app/

# جمع ملفات static
RUN python manage.py collectstatic --noinput

# الأمر الرئيسي لتشغيل التطبيق باستخدام Gunicorn
CMD ["gunicorn", "textproject.wsgi:application", "--bind", "0.0.0.0:8000"]
