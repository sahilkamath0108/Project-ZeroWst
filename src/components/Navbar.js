import React from 'react'
import { Grid, Typography } from '@mui/material';
import AppBar from '@mui/material/AppBar';
import Toolbar from '@mui/material/Toolbar';
import Container from '@mui/material/Container';
import logo from '../images/logo.jpeg'
import zIndex from '@mui/material/styles/zIndex';
import { motion } from "framer-motion";

export default function Navbar() {
  return (
    <>
      <AppBar position="static" sx={{ backgroundColor: "#03AC13" }}>
        <Container maxWidth="xxl">
          <Toolbar disableGutters>
            <Grid container>
              
              <motion.img
              initial={{width:'100%',rotate:0}}
              animate={{width:'9%',rotate:360}}
              transition={{delay:1,duration:1}}
              src={logo} style={{width:'9%',display:'inline-block',position:'absolute',top:-13,zIndex:'1'}}></motion.img>
              
              <Grid item md={1.3}></Grid>
              <Grid item md={6}>
                
                <Typography
                  variant="h4"
                  noWrap
                  component="a"
                  href="/"
                  sx={{
                    mr: 2,my:2,
                    display: { xs: 'flex', md: 'flex' },
                    fontFamily: 'monospace',
                    fontWeight: 900,
                    letterSpacing: '.3rem',
                    color: 'Black',
                    textDecoration: 'none',
                  }}
                >
                  ZeroWst
                </Typography>
              </Grid>
              {/* <Grid item md={6}>
                <Box sx={{ flexGrow: 1, display: { xs: 'flex', md: 'flex' }, width: '100%' }}>

                  <Button sx={{ my: 2, color: 'Black', display: 'block' }}>
                  <Typography
                  variant="h6"
                  noWrap
                  component="a"
                  href="/"
                  sx={{
                    mr: 2,
                    display: { xs: 'flex', md: 'flex' },
                    fontFamily: 'monospace',
                    fontWeight: 700,
                    letterSpacing: '.3rem',
                    color: 'Black',
                    textDecoration: 'none',
                  }}
                >
                  Hello
                </Typography>
                  </Button>

                </Box>
              </Grid> */}
            </Grid>





          </Toolbar>
        </Container>
      </AppBar>

    </>
  )
}
