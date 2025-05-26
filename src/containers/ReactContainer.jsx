import { HashRouter as Router, Routes, Route } from "react-router-dom";
import Navbar from "../components/common/Navbar";
import Home from "../pages/Home";
import About from "../pages/About";
import Experience from "../pages/Experience";
import Tech from "../pages/Tech";
import NotFound from "../pages/NotFound";

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
