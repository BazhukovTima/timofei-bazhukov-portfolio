import React, { useEffect, useState } from 'react';
import { Box, Grid } from "@mui/material";
import { useLocation } from "react-router-dom";

import Style from './MainContainer.module.scss'
import Navbar from './Navbar';
import useScrollObserver from './hooks/useScrollObserver';
import { singlePage } from '../../info/info';
import SinglePageRoutes from './SinglePageRoutes';
import MultiPageRoutes from './MultiPageRoutes';

// import SAPUI5Component from './components/sapui5/sapui5-container';

export default function MainContainer() {
    let [useSAPUI5, setUseSAPUI5] = useState(false);

    const location = useLocation();
    const [active, setActive] = useState(location.pathname === '/' ? 'home' : location.pathname.slice(1, location.pathname.length));

    const refHome = useScrollObserver(setActive);
    const refAbout = useScrollObserver(setActive);
    const refPortfolio = useScrollObserver(setActive);


    function handleToggleStyleChange() {
        let oppositeOfCurrenStyle = !useSAPUI5
        console.log(oppositeOfCurrenStyle)
        localStorage.setItem('styleSAPUI5', `${oppositeOfCurrenStyle}`)
        setUseSAPUI5(oppositeOfCurrenStyle)
    }

   useEffect(() => {
      let detectedStyleSAPUI5 = JSON.parse(localStorage.getItem('styleSAPUI5'));

      if (detectedStyleSAPUI5) {
         setUseSAPUI5(detectedStyleSAPUI5)
      } else {
         localStorage.setItem('styleSAPUI5', 'false')
      }
   }, []);

   return (
      // <Box className={useSAPUI5 ? Style.sapui5 : Style.react}>
      <Box className={useSAPUI5 ? Style.dark : Style.light}>
         <Grid container display={'flex'} flexDirection={'column'} minHeight={'100vh'}
            justifyContent={'space-between'}>
            <Grid item>
               <Navbar useSAPUI5={useSAPUI5} handleClick={handleToggleStyleChange} active={active} setActive={setActive} />
            </Grid>
            {/* <Grid item flexGrow={1}>
               {singlePage ? <SinglePageRoutes refs={{refHome, refAbout, refPortfolio}}/> : <MultiPageRoutes />}
            </Grid> */}
            <Grid item flexGrow={1}>
               {singlePage ? <SinglePageRoutes refs={{refHome, refAbout, refPortfolio}}/> : <MultiPageRoutes />}
            </Grid>
            <Grid item>
               <Box component={'footer'} display={'flex'} flexDirection={'column'} alignItems={'center'}
                  py={'1.5rem'} sx={{ opacity: 0.7 }} width={'100%'}>
                  <p>Timofei Bazhukov. </p>
                  <p>&copy; 2025</p>
               </Box>
            </Grid>
         </Grid>
      </Box>
   );
}