/**
 * @Author: kun
 * @Date: 2019-10
 */

import { Use, Description } from "./../common/application";
import * as Koa from "koa";
import { verify } from "../middleware/app-jwt";

export default function Role(...roles: string[]) {
  const role = Use(async (ctx: Koa.Context, next: () => Promise<void>) => {
    const signData = await verify(ctx);
    ctx.state.curUser = signData;
    await next();
  });

  const description = Description(`【${roles.join()}】`);

  return (target: any, propertyKey?: string) => {
    role(target, propertyKey);
    description(target, propertyKey);
  };
}
