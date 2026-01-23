# Base Image for the Docker Container 
FROM python:3.12

# Set the Working Directory
WORKDIR /app

# Copy Requirement File
COPY src/requirements.txt .

# Install the Required Packages
RUN pip install -r requirements.txt

# Copy Application Source Code
COPY src/ .

# Expose Application Port
EXPOSE 6400

# Command to Run the Application
CMD ["python", "server.py"]