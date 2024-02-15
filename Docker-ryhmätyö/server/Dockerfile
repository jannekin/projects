FROM python:3.8-slim
WORKDIR /app
RUN pip install Flask
COPY server_app.py .
RUN mkdir /serverdata
CMD ["python", "server_app.py"]