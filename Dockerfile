FROM python
WORKDIR /usr/src/app
COPY helloworld.py ./
#RUN pip install --no-cache-dir -r helloworld.py
COPY . .
CMD ["python","./helloworld.py"]

FROM tomcat:9
LABEL app=pythontest
COPY . /usr/local/tomcat/webapps
