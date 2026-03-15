FROM node:25.7.0-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .
RUN npm run build

FROM node:25.7.0-alpine AS runtime

WORKDIR /app

COPY --from=builder /app/node_modules /app/node_modules

COPY --from=builder /app/dist /app/dist

EXPOSE 3000

ENTRYPOINT ["node", "dist/index.js" ]