import React from 'react'
import ss1 from '../images//ss1.jpeg'
import { Box } from '@mui/system'
import { Grid } from '@mui/material'
export default function Carousel() {
const ss={width:"30vh",padding:2}
    return (<>
    <Grid container>
        <Grid item md={1}>
        </Grid>
        <Grid item md={2.7} >
            <img src={ss1} style={ss}></img>

        </Grid>
        <Grid item md={2.7}>
        <img src={ss1} style={ss}></img>
        </Grid>
        </Grid>
    </>
    )
}
