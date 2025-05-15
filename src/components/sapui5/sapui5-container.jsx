import React, { useEffect } from 'react';
import '@ui5/webcomponents/dist/Button.js';

const SAPUI5Component = () => {
  return (
    <div>
      <ui5-button onClick={() => alert("SAPUI5 Button Pressed")}>SAPUI5 Button</ui5-button>
    </div>
  );
};

export default SAPUI5Component;