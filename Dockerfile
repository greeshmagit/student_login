FROM FROM python:alpine3.10 as builder 
COPY  script.py ./
COPY  requirements.txt ./
RUN pip install --upgrade pip --no-cache-dir -r requirements.txt
CMD ["python","./script.py"]


FROM nginx:alpine
LABEL app = login
COPY . /usr/share/nginx/html
COPY --from=builder python /usr/share/nginx/html




 
