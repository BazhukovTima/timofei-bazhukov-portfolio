import React from 'react';
import { FaGithub, FaLinkedin, FaTwitter } from 'react-icons/fa';
import './SocialLinks.css';

const iconMap = {
  github: <FaGithub />,
  linkedin: <FaLinkedin />,
  twitter: <FaTwitter />
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
