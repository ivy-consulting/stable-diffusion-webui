# Use an official base image
FROM python:3.9-slim

# Create a non-root user
RUN useradd -m user

# Set the working directory
WORKDIR /app

# Copy the application files into the container
COPY . /app

# Set non-root user
USER user

# Install required dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the required port
EXPOSE 8000

# Run the web UI
CMD ["bash", "webui.sh", "--nowebui", "--host", "0.0.0.0", "--port", "8000"]