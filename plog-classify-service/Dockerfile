# Use a slim base image
FROM python:3.9-slim-buster

# Set the working directory
WORKDIR /app

# Install dependencies
COPY ./flask/requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY ./flask .

# Expose port
EXPOSE 5000

# Set environment variables
ENV FLASK_APP=app.py

# Run the Flask application
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]