import React from "react";
import ReactContainer from "./containers/ReactContainer";
import SapUi5Container from "./containers/SapUi5Container";
import FlutterContainer from "./containers/FlutterContainer";
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
