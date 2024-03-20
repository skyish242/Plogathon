# First stage for building and installing dependencies
FROM python:3.9 AS builder

# Set the working directory
WORKDIR /app

# Copy the requirements file and install dependencies
COPY ./flask/requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY ./flask /app

# Second stage for the final image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the dependencies from the builder stage
COPY --from=builder /app/python /usr/local/bin/python
COPY --from=builder /app/lib /usr/local/lib/python3.9/site-packages

# Copy the application code
COPY --from=builder /app /app

# Expose the port
EXPOSE 5000

# Set environment variables
ENV FLASK_APP=app.py

# Set the entrypoint to run the Flask application
ENTRYPOINT ["python", "app.py"]