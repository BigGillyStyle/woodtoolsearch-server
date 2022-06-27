"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const root = async (fastify, _opts) => {
    fastify.get("/", async function (_request, _reply) {
        return { root: true };
    });
};
exports.default = root;
