FROM node:22.17.0-alpine AS base
WORKDIR /app
COPY package*.json ./
COPY docker/entrypoint/entrypoint.front.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

FROM base AS dev
WORKDIR /app
COPY . .
EXPOSE 3000
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["npm", "run", "dev"]
