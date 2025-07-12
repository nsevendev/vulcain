FROM node:22.17.0-alpine AS base
WORKDIR /app
COPY package*.json ./
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

FROM base AS dev
WORKDIR /app
COPY . .
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["npm", "run", "dev"]

FROM base AS build
WORKDIR /app
COPY . .
RUN npm ci --only=production
RUN npm run build

FROM node:22.17.0-alpine AS prod
WORKDIR /app
RUN apk add --no-cache dumb-init
COPY --from=build /app/dist ./dist
COPY --from=build /app/node_modules ./node_modules
COPY --from=build /app/package*.json ./
EXPOSE 3000
USER node
ENTRYPOINT ["dumb-init", "--"]
CMD ["npm", "run", "preview"]

FROM node:22.17.0-alpine AS preprod
WORKDIR /app
RUN apk add --no-cache dumb-init
COPY --from=build /app/dist ./dist
COPY --from=build /app/node_modules ./node_modules
COPY --from=build /app/package*.json ./
EXPOSE 3000
USER node
ENTRYPOINT ["dumb-init", "--"]
CMD ["npm", "run", "preview"]
