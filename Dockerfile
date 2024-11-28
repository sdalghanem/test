# استخدم صورة Python مع إصدار 3.11
FROM python:3.11-slim

# إعداد بيئة العمل
WORKDIR /app

# تثبيت pip وتحديثه
RUN pip install --upgrade pip

# نسخ ملف المتطلبات
COPY requirements.txt .

# تثبيت الحزم المطلوبة
RUN pip install -r requirements.txt

# نسخ باقي الملفات إلى الحاوية
COPY . .

# تحديد المنفذ
EXPOSE 8000

# الأمر لتشغيل التطبيق
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
