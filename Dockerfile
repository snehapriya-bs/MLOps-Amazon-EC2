# Pull Python base image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy project files
COPY . .  
COPY bikeshare_model-0.0.1-py3-none-any.whl /app/

# Copy application files
COPY bike_sharing_api /app/bike_sharing_api

# Update pip
RUN pip install --upgrade pip

# Install dependencies
RUN pip install -r bike_sharing_api/requirements.txt

# Expose port for application
EXPOSE 8001

# Start FastAPI application
CMD ["python", "bike_sharing_api/app/main.py"]
