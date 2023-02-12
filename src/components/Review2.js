import React from 'react'
import {Carousel} from 'react-bootstrap'
import { Avatar, Typography } from '@mui/material';
import Card from '@mui/material/Card';
import CardHeader from '@mui/material/CardHeader';
import IconButton from '@mui/material/IconButton';
export default function Review2() {
    const r=[  {
        "id":1,
        "author":"Lewis",
        "re":"Great Food!!"
      },
      {
        "id":2,
        "author":"Garry",
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
        "author":"Ash",
        "re":"Trustable"
      },
      {
        "id":9,
        "author":"Manya",
        "re":"Excellent,keep it up!"
      },
      {
        "id":10,
        "author":"Manish",
        "re":"Average quality"
      },
      {
        "id":11,
        "author":"Tom",
        "re":"Great platform!"
      },
      {
        "id":12,
        "author":"Devika",
        "re":"Amazing quality"
      }
  
    ];
  
    const R=r.map(i=>{
        return(
            <>
            <Carousel.Item>
      <div className="review-card">

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
        </div>
      </Carousel.Item>
            </>
        )
    })
  return (
    <>
       
        <Carousel>
{/*         
            <Carousel.Item>
      <div className="review-card">
            <Avatar sx={{ bgcolor: "#03AC13" }} aria-label="recipe">
                {i.author[0]}
            </Avatar>
            <Typography variant='h4'>{i.author}</Typography>
            <Typography variant='subtitle1'>{i.re}</Typography>
        </div>
      </Carousel.Item>
         */}
      {/* {R} */}
      
      </Carousel>
    </>
  )
}
