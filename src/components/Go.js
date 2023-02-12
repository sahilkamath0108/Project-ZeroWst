import { Grid, Button, Typography } from '@mui/material'
import React from 'react'
import img from '../images/NoWst.jpg'
import { motion } from "framer-motion";
import ss1 from '../images//ss1.jpeg'
import GetAppIcon from '@mui/icons-material/GetApp';
import GetAppSharpIcon from '@mui/icons-material/GetAppSharp';
import './Go.css'
import play from '../images/playstore.png'
export default function Go() {
    const st = { width: '126%', padding: 10, marginleft: 10 }
    const buttonVariants = {
        hover: {
            scale: 1.1,
            textShadow: "0px 0px 8px rgb(255,255,255)",
            boxShadow: "0px 0px 8px rgb(255,255,255)",
            transition: {
                duration: 0.3,
                yoyo: Infinity
            }
        }
    }
    const ss={width:"35vh",padding:2}
    return (
        <>
            <Grid container>
                <Grid item md={5} xs={12}>
                    <img src={img} style={st} id='I1'></img>
                </Grid>
                {/* <Grid item md={2} sx={{ height: 500, alignItems: 'center', display: 'flex', width: '50%' }}>
                    <motion.div
                        whileHover={{ scale: 1.1 }}
                        whileFocus={{ scale: 1.1 }}
                        variants={buttonVariants}
                        initial={{ x: "800px" }}
                        animate={{ x: "-50px" }}
                        transition={{ delay: 0.25, type: "spring", damping: 10, mass: 1 }}
                    >
                        <Button variant='contained' sx={{ borderRadius: 10, backgroundColor: '#03AC13', alignContent: 'center', padding: 2, width: 200 }}>
                            <Typography variant='h3' sx={{ color: 'black' }}>ZW</Typography>

                        </Button>
                    </motion.div>
                </Grid> */}
                <Grid item md={2} xs={0}>
                </Grid>
                <Grid item md={2.5} xs={6}>
                    <img src={ss1} style={ss}></img>
                </Grid>
                <Grid item md={2.5} xs={6}>
                    <img src={ss1} style={ss}></img>
                </Grid>
            </Grid>
            <Grid container>
                <Grid item md={4}>

                </Grid>
                <Grid item md={4}>
                    
                    <motion.div 
                    initial={{x:'1200px'}}
                    animate={{
                                x:'100px'
                    }}
                    transition={{
                        delay:2,type:'spring',duration:1,stiffness:100
                    }}
            
                    
                    >
                        <Button variant='contained' sx={{ borderRadius: 10, backgroundColor: '#03AC13', alignContent: 'center', padding: 2, width: 200 }}>
                            <Typography variant='h3' sx={{ color: 'black' }}>ZW </Typography>
                            {/* <GetAppSharpIcon fontSize='large' sx={{color:'black'}}/> */}
                            <img src={play} style={{width:'20%'}} alt='heloo'></img>
                        </Button>
                    </motion.div>
                </Grid>
                <Grid item md={4}>

                </Grid>
            </Grid>
        </>
    )
}
