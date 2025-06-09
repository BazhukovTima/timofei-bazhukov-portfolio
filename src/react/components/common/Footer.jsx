import '../../styles/Footer.css';

const Footer = () => {
  const year = new Date().getFullYear();

  return (
    <footer className="footer">
      <p>© {year} Timofei Bazhukov. All rights reserved.</p>
    </footer>
  );
};

export default Footer;