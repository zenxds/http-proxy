FROM node:latest

ENV APP_DIR /var/www

ENV TZ Asia/Shanghai

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && mkdir -p $APP_DIR

WORKDIR $APP_DIR

COPY . $APP_DIR

RUN yarn install --production --registry=https://registry.npm.taobao.org

EXPOSE 8888

# Entrypoint
CMD ["npm", "run", "start:docker"]