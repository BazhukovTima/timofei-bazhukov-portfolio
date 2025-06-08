import React, { createContext, useContext, useState, useEffect } from "react";

const FrameworkContext = createContext();

export const FrameworkProvider = ({ children }) => {
  const [framework, setFramework] = useState(() => {
    return localStorage.getItem("framework") || "React";
  });

  useEffect(() => {
    localStorage.setItem("framework", framework);
  }, [framework]);

  return (
    <FrameworkContext.Provider value={{ framework, setFramework }}>
      {children}
    </FrameworkContext.Provider>
  );
};

export const useFramework = () => useContext(FrameworkContext);
