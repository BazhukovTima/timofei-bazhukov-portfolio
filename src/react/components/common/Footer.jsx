import '../../styles/Footer.css';

const Footer = ({ fixed = true }) => {
  const year = new Date().getFullYear();

  return (
    <footer className={`footer ${fixed ? 'fixed' : 'static'}`}>
      <p>© {year} Timofei Bazhukov. All rights reserved.</p>
    </footer>
  );
};

export default Footer;
