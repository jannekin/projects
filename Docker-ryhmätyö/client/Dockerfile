FROM python
WORKDIR /usr/app/
RUN pip install requests
RUN mkdir /clientdata
COPY client_app.py .
CMD ["python", "client_app.py"]