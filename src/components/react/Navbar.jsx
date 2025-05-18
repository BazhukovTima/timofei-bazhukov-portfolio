import React, { useEffect, useState } from "react";
import { Link, useLocation } from "react-router-dom";
import FrameworkSelector from "./FrameworkSelector";
import "./Navbar.css";

const Navbar = () => {
  const [scrolled, setScrolled] = useState(false);
  const location = useLocation();

  useEffect(() => {
    const handleScroll = () => {
      setScrolled(window.scrollY > 10);
    };

    window.addEventListener("scroll", handleScroll);
    return () => window.removeEventListener("scroll", handleScroll);
  }, [location.pathname]);

  const isActive = (path) => location.pathname === path;

  return (
    <nav className={`navbar ${scrolled ? "scrolled" : ""}`}>
      <ul>
        <li><Link to="/" className={isActive("/") ? "active" : ""}>Home</Link></li>
        <li><Link to="/about" className={isActive("/about") ? "active" : ""}>About</Link></li>
        <li><Link to="/tech" className={isActive("/tech") ? "active" : ""}>Technologies</Link></li>
        <li><Link to="/experience" className={isActive("/experience") ? "active" : ""}>Experience</Link></li>
      </ul>
      <FrameworkSelector />
    </nav>
  );
};

export default Navbar;
