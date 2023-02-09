FROM nginx:alpine as builder
LABEL app = login
COPY . /usr/share/nginx/html


FROM python:alpine3.10 as run 
COPY script.py ./
COPY requirements.txt ./
RUN pip install --upgrade pip --no-cache-dir -r requirements.txt
CMD ["python","./script.py"]
COPY --from=builder python /usr/share/nginx/html




 
