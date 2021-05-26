import { resolve } from "path";
const ROOT = resolve(__dirname, "../../");
require("dotenv").config({
  path: `${ROOT}/.env.${process.env.AUTO_JS_USE_ENV}`,
});
