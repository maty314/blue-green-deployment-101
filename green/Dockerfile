FROM python:3.8-slim

WORKDIR /app

COPY app.py .

# Expose port 5000
EXPOSE 5000

RUN pip install Flask

CMD ["python", "app.py"]

