
FROM python:alpine3.11 as builder 
COPY script.py ./
COPY requirements.txt ./
RUN  pip install --upgrade pip --no-cache-dir -r requirements.txt

FROM nginx:alpine as run
LABEL app = login
COPY --from=builder ./script.py /usr/share/nginx/html
CMD ["python3","./script.py"]

 
