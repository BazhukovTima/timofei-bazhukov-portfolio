import Style from './Navbar.module.scss';
import Toggler from "./Toggler";
import { HashLink as Link } from 'react-router-hash-link';
import { Box } from "@mui/material";
import { info } from "../../info/info";

const links = [
    {
        name: 'Home',
        to: '',
        active: 'home'
    },
    {
        name: 'About Me',
        to: 'about',
        active: 'about'
    },
    {
        name: info.initials,
        type: 'initials',
        to: '',
        active: 'home'
    },
    {
        name: 'Portfolio',
        to: 'portfolio',
        active: 'portfolio'
    }
]

// This function is used to create a scroll offset to compensate for the navbar
// when you click on the nav buttons to scroll down.
const scrollWidthOffset = (el) => {
    const yCoordinate = el.getBoundingClientRect().top + window.pageYOffset;
    const yOffset = -80; 
    window.scrollTo({ top: yCoordinate + yOffset, behavior: 'smooth' }); 
}


export default function Navbar({ useSAPUI5, handleClick, active, setActive }) {

    return (
        <Box component={'nav'} width={'100%'} position={info ? 'fixed' : 'relative'} className={Style.light}>
            <Box 
                component={'ul'} 
                display={'flex'} 
                justifyContent={'center'} 
                alignItems={'center'}
                gap={{ xs: '2rem', md: '8rem' }}
                textTransform={'lowercase'} fontSize={'1rem'}>
                {links.map((link, index) => (
                    <Box key={index} component={'li'} className={(link.active === active && !link.type) && Style.active}
                        sx={{ borderImageSource: info.gradient }}>
                        <Link to={info ? `#${link.to}` : `/${link.to}`}
                        scroll={el => scrollWidthOffset(el)}
                            smooth
                            onClick={() => setActive(link.active)} className={Style.link}>
                            {!link.type && <p style={{ padding: '0.5rem 0' }}>{link.name}</p>}
                            {link.type && <h1>{link.name}</h1>}
                        </Link>
                    </Box>
                ))}
                <li>
                    <Toggler useSAPUI5={useSAPUI5} handleClick={handleClick} />
                </li>
            </Box>
        </Box>
    )
}