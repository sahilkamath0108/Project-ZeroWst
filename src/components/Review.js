import React from 'react';
import { Grid, Typography } from '@mui/material';
import { motion } from "framer-motion";
import Card from '@mui/material/Card';
import CardHeader from '@mui/material/CardHeader';
import Avatar from '@mui/material/Avatar';
import IconButton from '@mui/material/IconButton';
export default function Review() {
  const r=[  {
      "id":1,
      "author":"Samarth",
      "re":"Great Food!!"
    },
    {
      "id":2,
      "author":"Sahil",
      "re":"Avg food,Cold"
    },
    {
      "id":3,
      "author":"Shreya",
      "re":"Nice,keep it up!"
    },
    {
      "id":4,
      "author":"Pooja",
      "re":"Worst food"
    },
    {
      "id":5,
      "author":"Dev",
      "re":"Good"
    },
    {
      "id":6,
      "author":"Radhika",
      "re":"mediocre"
    },
    {
      "id":7,
      "author":"Sarthak",
      "re":"Great service!!"
    },
    {
      "id":8,
      "author":"Simone",
      "re":"Trustable"
    },
    {
      "id":9,
      "author":"Manya",
      "re":"Excellent,keep it up!"
    },
    {
      "id":10,
      "author":"Samarth",
      "re":"Average quality"
    },
    {
      "id":11,
      "author":"Sam",
      "re":"Great platform!"
    },
    {
      "id":12,
      "author":"Devika",
      "re":"Amazing quality"
    }

  ];



  const R=r.map(i=>
    {
      let a=Math.random()
      console.log(a);
      if(a>0.5)
      {
        return(
          <>
          <motion.div
          inital={{y:'0px'}}
          animate={{y:'100px'}}
          transition={{delay:1 , type:'spring'}}
          >
          <Card sx={{width:300 ,padding:2,margin:5}}>
      <CardHeader
        avatar={
          <Avatar sx={{ bgcolor: "#03AC13" }} aria-label="recipe">
            {i.author[0]}
          </Avatar>
        }
        action={
          <IconButton aria-label="settings">
          </IconButton>
        }
        title={i.author}
        //subheader="September 14, 2016"
      />
      <Typography variant="body2">{i.re}</Typography>
      
      </Card>



          </motion.div>
          </>
        )
      }
    });
  return (
    <>
    <hr></hr>
    <Typography variant='h3' textAlign='center'>Reviews</Typography>
    <Grid container>
      {R}
        </Grid>    
    </>
  )
}
