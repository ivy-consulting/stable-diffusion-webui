FROM python:3.10-slim

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# # Add deadsnakes PPA and install Python 3.11
# RUN apt-get update && \
#     apt-get install -y software-properties-common && \
#     add-apt-repository ppa:deadsnakes/ppa && \
#     apt-get update && \
#     apt-get install -y python3.11 && \
#     apt-get clean

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Run webui.sh with --nowebui argument when the container launches
CMD ["bash", "webui.sh", "--nowebui", "--host", "0.0.0.0", "--port", "8000"]
