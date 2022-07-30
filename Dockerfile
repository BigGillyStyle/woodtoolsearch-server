FROM node:16.16.0-alpine3.16
ENV NODE_ENV=production

# https://github.com/nodejs/docker-node/blob/main/docs/BestPractices.md#handling-kernel-signals
# https://github.com/krallin/tini#alpine-linux-package
RUN apk add --no-cache tini
ENTRYPOINT ["/sbin/tini", "--"]

EXPOSE 3000
RUN mkdir /app && chown -R node:node /app
WORKDIR /app

# https://github.com/nodejs/docker-node/blob/main/docs/BestPractices.md#non-root-user
USER node

COPY --chown=node:node package.json package-lock.json ./
RUN npm ci --only=production && npm cache clean --force

# https://github.com/nodejs/docker-node/blob/main/docs/BestPractices.md#cmd
CMD ["node", "./node_modules/fastify-cli/cli.js", "start", "dist/app.js"]
