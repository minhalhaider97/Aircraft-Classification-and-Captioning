# Use slim for fast builds without compilation overhead
FROM python:3.14-slim

# Prevent Python from writing .pyc files and force unbuffered output
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set the working directory
WORKDIR /app

# Install pip and your requirements directly
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy your application code
COPY . .

# Expose port 5000
EXPOSE 5000

# Run your app
CMD ["python", "app.py"]