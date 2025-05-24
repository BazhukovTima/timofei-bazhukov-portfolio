import React, { useState, useEffect, useRef } from "react";
import { Link, useLocation } from "react-router-dom";
import "../../styles/ResponsiveNavbar.css";

const Navbar = () => {
  const [menuOpen, setMenuOpen] = useState(false);
  const [scrolled, setScrolled] = useState(false);
  const location = useLocation();
  const menuRef = useRef(null);

  // Обработка скролла для изменения внешнего вида
  useEffect(() => {
    const handleScroll = () => {
      setScrolled(window.scrollY > 50);
    };
    window.addEventListener("scroll", handleScroll);
    return () => window.removeEventListener("scroll", handleScroll);
  }, []);

  // Закрытие меню при клике вне
  useEffect(() => {
    const handleClickOutside = (event) => {
      if (
        menuOpen &&
        menuRef.current &&
        !menuRef.current.contains(event.target)
      ) {
        setMenuOpen(false);
      }
    };
    document.addEventListener("mousedown", handleClickOutside);
    return () => document.removeEventListener("mousedown", handleClickOutside);
  }, [menuOpen]);

  // Закрытие меню при смене маршрута
  useEffect(() => {
    setMenuOpen(false);
  }, [location]);

  // Сброс фокуса при закрытии меню
  useEffect(() => {
    if (!menuOpen && menuRef.current?.contains(document.activeElement)) {
      document.activeElement.blur();
    }
  }, [menuOpen]);

  return (
    <>
      <nav
        className={`navbar ${scrolled ? "scrolled" : ""} ${
          menuOpen ? "menu-open" : ""
        }`}
      >
        <button
          className="menu-toggle"
          onClick={() => setMenuOpen((prev) => !prev)}
          aria-label="Toggle menu"
          aria-expanded={menuOpen}
        >
          ☰
        </button>

        <ul className="nav-links">
          <li>
            <Link to="/" className={location.pathname === "/" ? "active" : ""}>
              Home
            </Link>
          </li>
          <li>
            <Link
              to="/about"
              className={location.pathname === "/about" ? "active" : ""}
            >
              About
            </Link>
          </li>
          <li>
            <Link
              to="/tech"
              className={location.pathname === "/tech" ? "active" : ""}
            >
              Technologies
            </Link>
          </li>
          <li>
            <Link
              to="/experience"
              className={location.pathname === "/experience" ? "active" : ""}
            >
              Experience
            </Link>
          </li>
        </ul>
      </nav>

      <div
        ref={menuRef}
        className={`side-menu ${menuOpen ? "open" : ""}`}
        inert={!menuOpen}
      >
        <ul>
          <li>
            <Link to="/" className={location.pathname === "/" ? "active" : ""}>
              Home
            </Link>
          </li>
          <li>
            <Link
              to="/about"
              className={location.pathname === "/about" ? "active" : ""}
            >
              About
            </Link>
          </li>
          <li>
            <Link
              to="/tech"
              className={location.pathname === "/tech" ? "active" : ""}
            >
              Technologies
            </Link>
          </li>
          <li>
            <Link
              to="/experience"
              className={location.pathname === "/experience" ? "active" : ""}
            >
              Experience
            </Link>
          </li>
        </ul>
      </div>
    </>
  );
};

export default Navbar;
