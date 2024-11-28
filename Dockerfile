# استخدم صورة Python كأساس
FROM python:3.9-slim

# تعيين الدليل للعمل داخل الحاوية
WORKDIR /app

# نسخ ملف المتطلبات وتثبيت الحزم
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# نسخ جميع ملفات المشروع إلى الحاوية
COPY . .

# تحديد الأمر الافتراضي لتشغيل تطبيق Django
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
