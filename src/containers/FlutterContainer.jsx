import React, { useEffect, useRef } from "react";

// eslint-disable-next-line no-unused-vars
let flutterApp = null;

const FlutterContainer = () => {
  const containerRef = useRef(null);

  useEffect(() => {
    if (!containerRef.current) return;

    // Берём текущий путь, добавляем завершающий слеш, если его нет
    let currentPath = window.location.pathname;
    if (!currentPath.endsWith("/")) {
      currentPath += "/";
    }

    const basePath = process.env.PUBLIC_URL || "";
    const script = document.createElement("script");
    script.src = `${basePath}/flutter/flutter.js`;
    script.async = true;

    script.onload = () => {
      if (window._flutter?.loader) {
        window._flutter.loader.loadEntrypoint({
          entryPointBaseUrl: `${basePath}/`,
          entrypointUrl: `${basePath}/flutter/main.dart.js`,
          onEntrypointLoaded: async (engineInitializer) => {
            const engine = await engineInitializer.initializeEngine();
            flutterApp = engine;
            engine.runApp();
          },
        });
      } else {
        console.error("Flutter loader не найден");
      }
    };

    document.body.appendChild(script);

    return () => {
      // Удаляем flutter.js
      if (script.parentNode) {
        script.parentNode.removeChild(script);
      }

      // Удаляем все возможные Flutter-элементы
      document
        .querySelectorAll(
          "flutter-view, flt-glass-pane, flt-scene-host, canvas, flt-semantics-host"
        )
        .forEach((el) => el.remove());

      // Очищаем flutter-root
      const flutterRoot = document.getElementById("flutter-root");
      if (flutterRoot) flutterRoot.innerHTML = "";

      // Сброс ссылок/стилей
      flutterApp = null;
      document.body.style.overflow = "";
    };
  }, []);

  return (
    <div
      ref={containerRef}
      id="flutter-root"
      style={{
        width: "100vw",
        height: "100vh",
        position: "relative",
        overflow: "hidden",
      }}
    />
  );
};

export default FlutterContainer;
