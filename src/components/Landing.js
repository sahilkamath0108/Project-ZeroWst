import { Grid } from '@mui/material';
import React from 'react';
import Carousel from './Carousel';
import Go from './Go';
import Navbar from './Navbar';
import Review from './Review';
import { motion } from "framer-motion";
import Review2 from './Review2';
export default function Landing() {
  return (
    <>
    <Navbar></Navbar>
    <br/>
    <Go></Go>
    {/* <Carousel></Carousel> */}
    {/* <Review></Review> */}
    {/* <Review2></Review2> */}
    </>
  )
}
