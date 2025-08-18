FROM python:3.11-slim

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --upgrade pip setuptools wheel

RUN pip install -r /app/requirements.txt

# Create a non-root user
RUN addgroup --system appgroup && adduser --system appuser --ingroup appgroup

# Switch to non-root
USER appuser

# Make port 80 available to the world outside this container
EXPOSE 5000

# Define environment variable
ENV NAME World

# Run app.py when the container launches
CMD ["python", "app.py"]
