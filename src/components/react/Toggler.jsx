import React from 'react';
import {Box} from "@mui/material";

export default function Toggler({useSAPUI5, handleClick}) {
    const transition = 'all 250ms ease'

   return (
      <Box fontSize={'1.5rem'} sx={{cursor: 'pointer', ":hover": {transform: 'translateY(-3px)', transition: transition}}}>
         {
            useSAPUI5 ?
               <span onClick={handleClick} aria-label="SAPUI5" role="img">SAPUI5</span>
               :
               <span onClick={handleClick} aria-label="React" role="img">React</span>
         }
      </Box>
   )
}