import { initializeABAP } from "../output/_init.mjs";
await initializeABAP();

async function redirectFetch(url, options = {}) {
  console.dir("redirectFetch");

  let data = "";

  // имитация объекта res с методами, как в express
  const res = {
    append: (d) => {
      console.dir("append2: " + d);
    },
    send: (d) => {
      console.dir("send2");
      data = Buffer.from(d).toString();
    },
    status: (status) => {
      console.dir("status2: " + status);
      return res;
    },
  };

  const method = options.method || "GET";
  let body = options.body || "";

  // Подготовим тело, как в express-сервере
  if (method === "POST" && body) {
    // Если тело — Buffer (в браузере, возможно, ArrayBuffer или string)
    // в браузере Buffer может не быть, надо проверить, или использовать Uint8Array
    try {
      // Преобразуем тело к строке и парсим JSON
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
      console.error("Failed to parse or process JSON body:", err);
      // Возвращаем ошибку в стиле fetch
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

  // Формируем объект запроса, как в express-сервере
  const req = {
    body: Buffer.from(body).toString("hex"),
    method: method,
    path: url,
    url: url,
  };

  console.dir(req);

  await abap.Classes["CL_EXPRESS_ICF_SHIM"].run({ req, res, class: "ZCL_SICF" });

  console.log("redirectFetch RESPONSE,");
  console.dir(data);

  return {
    ok: true,
    json: async () => JSON.parse(data),
    text: async () => data,
  };
}

console.dir("entry, web.mjs");
globalThis.fetch = redirectFetch;

std();