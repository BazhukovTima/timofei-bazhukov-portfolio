import React from "react";
import ReactContainer from "./containers/ReactContainer";
import SapUi5Container from "./containers/SapUi5Container";
import FlutterContainer from "./containers/FlutterContainer";
import Abap2ui5Container from "./containers/Abap2ui5Container";
import FloatingFrameworkIconSelector from "./react/components/common/FloatingFrameworkIconSelector";
import { useFramework } from "./frameworkContext";

const App = () => {
  const { framework } = useFramework();

  return (
    <>
      {framework === "React" && <ReactContainer />}
      {framework === "SAPUI5" && <SapUi5Container />}
      {framework === "Flutter" && <FlutterContainer />}
      {framework === "abap2ui5" && <Abap2ui5Container />}
      <FloatingFrameworkIconSelector />
    </>
  );
};

export default App;
