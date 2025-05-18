import React, { createContext, useContext, useState } from "react";

const FrameworkContext = createContext();

export const FrameworkProvider = ({ children }) => {
  const [framework, setFramework] = useState("SAPUI5");
  // const [framework, setFramework] = useState("React");
  return (
    <FrameworkContext.Provider value={{ framework, setFramework }}>
      {children}
    </FrameworkContext.Provider>
  );
};

export const useFramework = () => useContext(FrameworkContext);
