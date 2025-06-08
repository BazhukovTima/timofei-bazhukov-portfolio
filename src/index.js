import React from "react";
import { HashRouter } from "react-router-dom";
import ReactDOM from "react-dom/client";
import App from "./App.jsx";
import { FrameworkProvider } from "./frameworkContext.jsx";

const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
  <HashRouter>
    <FrameworkProvider>
      <App />
    </FrameworkProvider>
  </HashRouter>
);
