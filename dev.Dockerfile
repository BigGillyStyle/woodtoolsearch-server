FROM node:19.0.0-bullseye
ENV NODE_ENV=development
ENV FASTIFY_ADDRESS=0.0.0.0
ENV FASTIFY_PORT=3000
ENV PATH=/app/node_modules/.bin:$PATH
EXPOSE 3000
RUN mkdir /app && chown -R node:node /app
WORKDIR /app
RUN npm install --location=global npm@8.18.0
USER node
RUN echo 'alias ll="ls -alF"' >> ~/.bashrc
COPY --chown=node:node package.json package-lock.json ./
RUN npm install
CMD ["npm", "run", "dev"]
