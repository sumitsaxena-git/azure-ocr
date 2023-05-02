# Use the official Python base image
FROM python:3.9-slim

# Install system dependencies
RUN apt-get update && \
    apt-get install -y poppler-utils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install the required Python packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy the Python script into the container
COPY azure_ocr.py .

# Create the input and output directories
RUN mkdir ocr_docs_input ocr_docs_output

# Run the Python script when the container starts
CMD ["python", "azure_ocr.py"]
