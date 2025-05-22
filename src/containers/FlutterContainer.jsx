const FlutterContainer = () => {
  return (
    <iframe
      src="/flutter/index.html"
      style={{
        position: "absolute",
        top: 0,
        left: 0,
        width: "100vw",
        height: "100vh",
        border: "none",
        zIndex: 1000,
      }}
      title="Flutter Web App"
    />
  );
};

export default FlutterContainer;
