import { Link } from "react-router-dom";

const NotFound = () => {
  return (
    <div style={{ padding: "2rem", textAlign: "center" }}>
      <h1>404 - Not found</h1>
      <Link to="/" style={{ color: "blue", textDecoration: "underline" }}>
        Go home
      </Link>
    </div>
  );
};

export default NotFound;
