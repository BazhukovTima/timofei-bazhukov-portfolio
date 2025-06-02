import { HashRouter as Router, Routes, Route } from "react-router-dom";
import Navbar from "../react/components/common/Navbar";
import Home from "../react/pages/Home";
import About from "../react/pages/About";
import Experience from "../react/pages/Experience";
import Tech from "../react/pages/Tech";
import NotFound from "../react/pages/NotFound";

const ReactContainer = () => {
  return (
    <Router>
      <Navbar />
      <main>
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/about" element={<About />} />
          <Route path="/tech" element={<Tech />} />
          <Route path="/experience" element={<Experience />} />
          <Route path="*" element={<NotFound />} />
        </Routes>
      </main>
    </Router>
  );
};

export default ReactContainer;
