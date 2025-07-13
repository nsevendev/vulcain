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

FROM oven/bun:1-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN bun install
COPY . .
RUN bun run build

FROM oven/bun:1-alpine AS prod
WORKDIR /app
RUN apk add --no-cache dumb-init
COPY --from=build /app/dist ./dist
COPY --from=build /app/package*.json ./
RUN bun install --production
USER bun
ENTRYPOINT ["dumb-init", "--"]
CMD ["bun", "run", "serve"]

FROM oven/bun:1-alpine AS preprod
WORKDIR /app
RUN apk add --no-cache dumb-init
COPY --from=build /app/dist ./dist
COPY --from=build /app/package*.json ./
RUN bun install --production
USER bun
ENTRYPOINT ["dumb-init", "--"]
CMD ["bun", "run", "serve"]
