import React, { useEffect, useRef } from "react";

let flutterApp = null;

const FlutterContainer = () => {
  const containerRef = useRef(null);

  useEffect(() => {
    if (!containerRef.current) return;

    // Берём текущий путь, добавляем завершающий слеш, если его нет
    let currentPath = window.location.pathname;
    if (!currentPath.endsWith('/')) {
      currentPath += '/';
    }

    const script = document.createElement("script");
    script.src = "/flutter/flutter.js";
    script.async = true;

    script.onload = () => {
      if (window._flutter && window._flutter.loader) {
        window._flutter.loader.loadEntrypoint({
          // Передаём currentPath как базовый URL — чтобы base href совпадал с ним
          entryPointBaseUrl: currentPath,
          entrypointUrl: "/flutter/main.dart.js",
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
      if (script.parentNode) {
        script.parentNode.removeChild(script);
      }
      document.querySelectorAll('flt-glass-pane, flt-scene-host, canvas')
        .forEach(el => el.remove());
      const flutterRoot = document.getElementById('flutter-root');
      if (flutterRoot) flutterRoot.innerHTML = '';
      flutterApp = null;
      document.body.style.overflow = '';
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
