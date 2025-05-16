import React from 'react';
import profile from '../../assets/profile-no-bg.png';
import info from '../../data/info.json';
import SocialLinks from './SocialLinks';
import './colors.css';
import './Home.css';
import './Avatar.css';

const Home = () => {
  const { name, role, description, social } = info;

  return (
    <section className="home-section">
      <div className="container">
        <div className="intro">
          <h1>{name}</h1>
          <div className="role">{role}</div>
          <p className="description">{description}</p>
          <SocialLinks social={social} />
        </div>
        <div class="avatar-container">
          <img class="avatar" src={profile} alt="Avatar" />
        </div>
      </div>
    </section>
  );
};

export default Home;
