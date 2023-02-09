FROM nginx:alpine as builder
LABEL app = login
COPY . /usr/share/nginx/html


FROM python:alpine3.11 as run 
COPY script.py ./
COPY requirements.txt ./
RUN  pip install --upgrade pip --no-cache-dir -r requirements.txt
CMD ["python3","./script.py"]
COPY --from=builder  /usr/share/nginx/html/* ./script.py




 
