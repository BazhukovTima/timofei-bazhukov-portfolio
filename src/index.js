import React from "react";
import ReactDOM from "react-dom/client";
import App from "./App.jsx";
import { FrameworkProvider } from "./frameworkContext.jsx";

const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
  <FrameworkProvider>
    <App />
  </FrameworkProvider>
);
