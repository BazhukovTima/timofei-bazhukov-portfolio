import React from "react";
import ReactContainer from "./components/react/ReactContainer";
import SapUi5Container from "./components/sapui5/SapUi5Container";
import FlutterContainer from "./components/flutter/FlutterContainer";
import FloatingFrameworkIconSelector from "./components/common/FloatingFrameworkIconSelector";
import { useFramework } from "./frameworkContext";

const App = () => {
  const { framework } = useFramework();

  return (
    <>
      {framework === "React" && <ReactContainer />}
      {framework === "SAPUI5" && <SapUi5Container />}
      {framework === "Flutter" && <FlutterContainer />}
      <FloatingFrameworkIconSelector /> {/* всегда сверху */}
    </>
  );
};

export default App;
