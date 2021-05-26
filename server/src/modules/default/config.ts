import { NODE_ENV } from "./../../utils/enums";

export default {
  env: NODE_ENV.dev,
  port: Number(process.env.AUTO_JS_PORT),
};
