import React from 'react'
import { Grid, Typography } from '@mui/material';
import AppBar from '@mui/material/AppBar';
import Box from '@mui/material/Box';
import Toolbar from '@mui/material/Toolbar';
import IconButton from '@mui/material/IconButton';
import Menu from '@mui/material/Menu';
import Container from '@mui/material/Container';
import Avatar from '@mui/material/Avatar';
import Button from '@mui/material/Button';
import Tooltip from '@mui/material/Tooltip';
import MenuItem from '@mui/material/MenuItem';
//import img1 from './Image/Nowst.jpg'

export default function Navbar() {
  return (
    <>
      <AppBar position="static" sx={{ backgroundColor: "#03AC13" }}>
        <Container maxWidth="xxl">
          <Toolbar disableGutters>
            <Grid container>
              <Grid item md={6}>
                <Typography
                  variant="h6"
                  noWrap
                  component="a"
                  href="/"
                  sx={{
                    mr: 2,my:2,
                    display: { xs: 'flex', md: 'flex' },
                    fontFamily: 'monospace',
                    fontWeight: 700,
                    letterSpacing: '.3rem',
                    color: 'Black',
                    textDecoration: 'none',
                  }}
                >
                  ZeroWst
                </Typography>
              </Grid>
              <Grid item md={6}>
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
              </Grid>
            </Grid>





          </Toolbar>
        </Container>
      </AppBar>

    </>
  )
}
