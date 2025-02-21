# Use an official Python image as a base image
FROM python:3.9-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
    git \
    && apt-get clean

# Create a non-root user
RUN useradd -m user

# Set the working directory
WORKDIR /app

# Copy the application files into the container
COPY . /app

# Change ownership of the app directory to the user
RUN chown -R user:user /app

# Set non-root user
USER user

# Create and activate the python virtual environment
RUN python3 -m venv venv

# Install Python dependencies inside the venv
RUN ./venv/bin/pip install --no-cache-dir -r requirements.txt

# Expose port
EXPOSE 8000

# Run the web UI
CMD ["bash", "webui.sh", "--nowebui", "--host", "0.0.0.0", "--port", "8000"]