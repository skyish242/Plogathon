# Use a slim base image
FROM python:3.9 AS builder

# Set the working directory
WORKDIR /app

# Install dependencies
COPY ./flask/requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY ./flask /app

# Second stage for final image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy only necessary files from the builder stage
COPY --from=builder /app /app

# Expose port
EXPOSE 5000

# Set environment variables
ENV FLASK_APP=app.py

# Run the Flask application
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]