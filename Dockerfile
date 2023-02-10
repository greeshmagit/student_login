
#FROM python:alpine3.11 as builder 
#WORKDIR /usr/src/app
#ADD . /usr/src/app
#COPY script.py /usr/src/app
#COPY requirements.txt /usr/src/app
#RUN  pip install --upgrade pip --no-cache-dir -r requirements.txt


FROM nginx:alpine as run
LABEL app = login
COPY . /usr/share/nginx/html/
#COPY --from=builder /usr/src/app/ /usr/share/nginx/html/
CMD ["python","./script.py"]

 
