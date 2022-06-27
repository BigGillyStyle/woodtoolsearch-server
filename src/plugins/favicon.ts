import fp from "fastify-plugin";
import favicon from "fastify-favicon";

export default fp(async (fastify, _opts) => {
  // example without specifying options, searching favicon.ico from project root,
  // otherwise returning a default favicon
  fastify.register(favicon);
});
