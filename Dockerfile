# Use an official Python image as a base image
FROM python:3.9-slim

ENV PYTORCH_CUDA_ALLOC_CONF=expandable_segments:True

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
    wget \
    git \
    libglib2.0-0 \
    libgl1 \
    google-perftools \
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

RUN python3 -m venv venv && \
    . venv/bin/activate && \
    pip install --no-cache-dir -r requirements.txt

# Expose port
EXPOSE 8000

# Run the web UI
CMD ["bash", "webui.sh", "--nowebui"]