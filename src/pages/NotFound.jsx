import React from "react";
import { Link } from "react-router-dom";

const NotFound = () => {
  return (
    <div style={{ padding: "2rem", textAlign: "center" }}>
      <h1>404 - Страница не найдена</h1>
      <p>Кажется, вы перешли по неправильному пути.</p>
      <Link to="/" style={{ color: "blue", textDecoration: "underline" }}>
        Вернуться на главную
      </Link>
    </div>
  );
};

export default NotFound;
