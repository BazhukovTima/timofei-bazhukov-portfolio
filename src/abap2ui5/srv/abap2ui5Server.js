import express from "express";
import { initializeABAP } from "../output/init.mjs";
import { cl_express_icf_shim } from "../output/cl_express_icf_shim.clas.mjs";

await initializeABAP();

const PORT = 3000;
const APP = "zcl_main_page";

const app = express();
app.disable("x-powered-by");
app.set("etag", false);
app.use(express.raw({ type: "*/*" }));

app.all(["/", "/*"], async (req, res) => {
  let body = req.body;

  if (req.method === "POST" && body) {
    if (Buffer.isBuffer(body)) {
      try {
        body = JSON.parse(body.toString("utf8"));
      } catch (err) {
        console.error("Failed to parse JSON:", err);
        return res.status(400).send("Invalid JSON");
      }
    }

    const sfront = body.S_FRONT;
    if (sfront && typeof sfront === "object") {
      sfront.SEARCH = `?app_start=${APP}`;

      const config = sfront.CONFIG;
      if (config && typeof config === "object") {
        config.pathname = (sfront.ORIGIN ?? "") + sfront.SEARCH;
      }
    }
    req.body = Buffer.from(JSON.stringify(body), "utf8");
  }

  await cl_express_icf_shim.run({ req, res, class: "ZCL_SICF" });
});

app.listen(PORT, () => {
  console.log(`Listening on http://localhost:${PORT}`);
});
