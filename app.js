const express = require("express")
require("./db")
require('dotenv').config()
const providerRoutes = require("./routes/providerRoutes")
const userRoutes = require("./routes/userRoutes")
const adminRoutes = require("./routes/adminRoutes")
const foodRoutes = require("./routes/foodRoutes")
const cors = require("cors")
const bodyParser = require("body-parser")

const app = express()
app.use(cors())
app.use(bodyParser.json());



app.use(express.json())

// User 
app.use('/user',userRoutes)

//provider
app.use('/provider',providerRoutes)

//admin
app.use('/admin',adminRoutes);

// //food
// app.use("/food",foodRoutes)

app.listen(process.env.PORT || 3000, ()=>{
  console.log('The server is up and running at port 3000')
})


