"use strict";

const fp = require("fastify-plugin");

module.exports = fp(async function (fastify, opts) {
  // example without specifying options, searching favicon.ico from project root,
  // otherwise returning a default favicon
  fastify.register(require("fastify-favicon"));
});
