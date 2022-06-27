"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const fastify_plugin_1 = __importDefault(require("fastify-plugin"));
const fastify_favicon_1 = __importDefault(require("fastify-favicon"));
exports.default = (0, fastify_plugin_1.default)(async (fastify, _opts) => {
    // example without specifying options, searching favicon.ico from project root,
    // otherwise returning a default favicon
    fastify.register(fastify_favicon_1.default);
});
