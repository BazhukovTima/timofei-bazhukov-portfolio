import React from "react";
import ReactContainer from "./components/react/ReactContainer";
import SapUi5Container from "./components/sapui5/SapUi5Container";
import { useFramework } from "./frameworkContext";

const App = () => {
  const { framework } = useFramework();

  return (
    <>
      {framework === "React" && <ReactContainer />}
      {framework === "SAPUI5" && <SapUi5Container />}
    </>
  );
};

export default App;
