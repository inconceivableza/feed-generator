FROM node:18

# install expect to handle inquirer prompt for automation
RUN apt update; apt install -y expect ; \
    npm install -g ts-node;

WORKDIR /app
COPY . .
RUN yarn install --frozen-lockfile

ENV NODE_ENV=production
ENV FEEDGEN_PORT=3000
EXPOSE 3000

CMD yarn start

LABEL org.opencontainers.image.source=https://github.com/inconceivableza/feed-generator
