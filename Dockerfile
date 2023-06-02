FROM node:18-alpine3.16 

WORKDIR /app

COPY package*.json ./

RUN npm install && \
    addgroup -S appgroup && adduser -S appuser -G appgroup 

COPY . .

ENV SERVER_PORT 5000

EXPOSE "$SERVER_PORT"

USER appuser

CMD ["npm","start"]