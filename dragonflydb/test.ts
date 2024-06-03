// Deno
import { Redis } from "npm:@upstash/redis";

const redis = new Redis({
  url: "http://127.0.0.1:6379",
  token: "example_token",
});

// string
await redis.set("key", "value");
let data = await redis.get("key");
console.log(data);
