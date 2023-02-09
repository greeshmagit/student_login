
FROM python:alpine3.11 as builder 
WORKDIR /usr/src/app
COPY script.py /usr/src/app
COPY requirements.txt /usr/src/app
RUN  pip install --upgrade pip --no-cache-dir -r requirements.txt


FROM nginx:alpine as run
LABEL app = login
COPY --from=builder usr/src/app/script.py /usr/share/nginx/html
CMD ["python3","./script.py"]

 
