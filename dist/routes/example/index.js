"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const example = async (fastify, _opts) => {
    fastify.get("/", async function (_request, _reply) {
        return "this is an example";
    });
};
exports.default = example;
