# استخدام صورة Python
FROM python:3.10-slim

# تعيين مجلد العمل
WORKDIR /app

# نسخ ملف المتطلبات
COPY requirements.txt /app/

# تثبيت المتطلبات
RUN pip install --no-cache-dir -r requirements.txt

# نسخ جميع الملفات إلى المجلد الداخلي
COPY . /app/

# تعيين أمر بدء تشغيل التطبيق
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "testproject.wsgi:application"]
