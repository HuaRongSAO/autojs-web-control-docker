import { DBM } from "./../common/dbm";
import getLogger from "./log4js";

const logger = getLogger("db.ts");

console.log(
  "db:",
  process.env.AUTO_JS_MYSQL_HOST,
  process.env.AUTO_JS_MYSQL_PORT
);

const orm = new DBM({
  connectionLimit: 10,
  host: process.env.AUTO_JS_MYSQL_HOST,
  port: Number(process.env.AUTO_JS_MYSQL_PORT),
  user: "root",
  password: "root",
  database: "cloud_auto",
  isDebug: true,
});

orm.setLogger(logger as any);

export default orm;
