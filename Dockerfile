FROM python:3.8-slim

# Set the working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy application code
COPY . .

## Expose the Flask app port
EXPOSE 5000

# Command to run the Flask app
CMD ["python", "app.py"]
#
