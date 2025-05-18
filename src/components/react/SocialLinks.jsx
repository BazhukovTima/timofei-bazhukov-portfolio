import React from 'react';
import { FaFacebook, FaGithub, FaLinkedin } from 'react-icons/fa';
import { MdEmail } from "react-icons/md";
import './SocialLinks.css';

const iconMap = {
  linkedin: <FaLinkedin />,
  facebook: <FaFacebook />,
  github: <FaGithub />,
  email: <MdEmail />
};

const SocialLinks = ({ social }) => {
  return (
    <div className="social-links">
      {social.map(({ platform, url }, i) => {
        const icon = iconMap[platform.toLowerCase()] || platform;
        return (
          <a
            key={i}
            href={url}
            target="_blank"
            rel="noreferrer"
            aria-label={platform}
            className="social-link"
          >
            {icon}
          </a>
        );
      })}
    </div>
  );
};

export default SocialLinks;
