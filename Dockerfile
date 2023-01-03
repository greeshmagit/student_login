FROM nginx:alpine
LABEL app = login
COPY . /usr/share/nginx/html
