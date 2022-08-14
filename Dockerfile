FROM node:16.16.0-alpine3.16 as builder
RUN mkdir /app && chown -R node:node /app
WORKDIR /app
# https://github.com/nodejs/docker-node/blob/main/docs/BestPractices.md#non-root-user
USER node
# COPY --chown=node:node package.json package-lock.json tsconfig.json src ./
COPY --chown=node:node . ./
RUN npm ci \
 && npm run build:ts

FROM node:16.16.0-alpine3.16
ENV NODE_ENV=production
EXPOSE 3000
# https://github.com/nodejs/docker-node/blob/main/docs/BestPractices.md#handling-kernel-signals
# https://github.com/krallin/tini#alpine-linux-package
RUN apk add --no-cache tini
ENTRYPOINT ["/sbin/tini", "--"]
RUN mkdir /app && chown -R node:node /app
WORKDIR /app
# https://github.com/nodejs/docker-node/blob/main/docs/BestPractices.md#non-root-user
USER node
COPY --from=builder /app/dist /app/dist
COPY --from=builder /app/package.json /app/package-lock.json /app/favicon.ico ./
RUN npm ci --omit=dev && npm cache clean --force
# https://github.com/nodejs/docker-node/blob/main/docs/BestPractices.md#cmd
CMD ["node", "./node_modules/fastify-cli/cli.js", "start", "dist/app.js"]
