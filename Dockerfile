# Use an official Python runtime as a parent image


FROM python:3.10-slim-buster

# Set the working directory in the container to /app
WORKDIR /app

# Add the current directory contents into the container at /app
ADD . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install --no-cache-dir pywin32, comtypes

RUN python app.py --setup

# Make port 80 available to the world outside this container
EXPOSE 5001

# Run engine.py when the container launches
ENTRYPOINT ["python", "engine.py"]