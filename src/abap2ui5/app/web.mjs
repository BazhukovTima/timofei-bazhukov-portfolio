import { initializeABAP } from "../output/_init.mjs";
await initializeABAP();

async function redirectFetch(url, options = {}) {

  let data = "";
  const res = {
    append: (d) => {},
    send: (d) => {
      data = Buffer.from(d).toString();
    },
    status: (status) => {
      return res;
    },
  };

  const method = options.method || "GET";
  let body = options.body || "";
  
  if (method === "POST" && body) {
    try {
      let parsedBody;
      if (body instanceof ArrayBuffer || ArrayBuffer.isView(body)) {
        parsedBody = JSON.parse(new TextDecoder().decode(body));
      } else if (typeof body === "string") {
        parsedBody = JSON.parse(body);
      } else {
        parsedBody = body;
      }

      const sfront = parsedBody.S_FRONT;
      if (sfront && typeof sfront === "object") {
        sfront.SEARCH = `?app_start=zcl_main_page`;

        const config = sfront.CONFIG;
        if (config && typeof config === "object") {
          config.pathname = (sfront.ORIGIN ?? "") + sfront.SEARCH;
        }
      }

      body = Buffer.from(JSON.stringify(parsedBody), "utf8");
    } catch (err) {
      return {
        ok: false,
        status: 400,
        json: async () => ({ error: "Invalid JSON" }),
        text: async () => "Invalid JSON",
      };
    }
  } else if (typeof body === "string") {
    body = Buffer.from(body, "utf8");
  }

  const req = {
    body: Buffer.from(body).toString("hex"),
    method: method,
    path: url,
    url: url,
  };

  await abap.Classes["CL_EXPRESS_ICF_SHIM"].run({ req, res, class: "ZCL_SICF" });

  return {
    ok: true,
    json: async () => JSON.parse(data),
    text: async () => data,
  };
}

globalThis.fetch = redirectFetch;
std();