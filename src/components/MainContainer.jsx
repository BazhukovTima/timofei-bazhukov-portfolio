import React from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";

import Navbar from "./react/Navbar";
import Home from "./react/Home";
import About from "./react/About";
import Portfolio from "./react/Portfolio";

const MainContainer = () => (
  <Router>
    <Navbar />
    <main>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/about" element={<About />} />
        <Route path="/portfolio" element={<Portfolio />} />
      </Routes>
    </main>
  </Router>
);

export default MainContainer;
