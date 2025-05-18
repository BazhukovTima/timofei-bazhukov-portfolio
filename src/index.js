import React from "react";
import ReactDOM from "react-dom/client";
import App from "./App";
import { FrameworkProvider } from "./frameworkContext";

const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
  <FrameworkProvider>
    <App />
  </FrameworkProvider>
);
