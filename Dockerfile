# pull python base image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy project files
COPY . .
COPY bikeshare_model-0.0.1-py3-none-any.whl /app/

# copy application files
RUN ls -ltr && pwd
COPY bikeshare_model_api /app/bikeshare_model_api


# update pip
RUN pip install --upgrade pip

# install dependencies
RUN pip install -r bikeshare_model_api/requirements.txt

# expose port for application
EXPOSE 8001

# start fastapi application
CMD ["python", "app/main.py"]
