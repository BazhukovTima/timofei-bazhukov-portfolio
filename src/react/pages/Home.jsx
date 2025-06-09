import SocialLinks from "../components/home/SocialLinks";
import Footer from "../components/common/Footer";
import "../styles/colors.css";
import "../styles/ResponsiveHome.css";
import profile from "../../assets/profile-no-bg.png";

const Home = ({ info }) => {
  if (!info || !info.name) return null;

  const { name, role, description, location, social } = info;

  return (
    <section className="home-section">
      <div className="container-home">
        <div className="avatar-container">
          <img className="avatar" src={profile} alt="Avatar" />
        </div>
        <div className="intro">
          <h1>{name}</h1>
          <div className="role">{role}</div>
          <p className="description">{description}</p>
          <p className="description">{location}</p>
          <SocialLinks social={social} />
        </div>
      </div>
      <Footer />
    </section>
  );
};

export default Home;
