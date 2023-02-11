require("dotenv").config()

const UserSchema = require("../models/userSchema")
const FoodSchema = require("../models/foodSchema")

const bcrypt = require("bcryptjs")
const nodemailer = require("nodemailer")
const otpGenerator = require("otp-generator")
const multer = require("multer")

let mailTransporter = nodemailer.createTransport({
    service: "gmail",
    auth: {
      user: process.env.EMAIL,
      pass: process.env.PASSWORD,
    },
    port: 465,
  });

const fileVerifyPfp = multer({
    limits: {
        fileSize: 1000000
    },
    fileFilter(req, file, callback){
        if(!file.originalname.match(/\.jpg|jpeg|png/)) {
            return callback(new Error('Incorrect file format!'))
        }
        callback(undefined, true)
    }
})


//create user

const createUser = async (req, res) => {
    try {
      let userData = new UserSchema(req.body);
      let savedUserData = await userData.save();
      let id = savedUserData._id;
      userMail = savedUserData.email;
  
      mailTransporter.sendMail({
        from: process.env.EMAIL,
        to: userMail,
        subject:"Thank you for creating an account " +savedUserData.fname,
        text: "We hope you have a good time with our app.",
      });
  
      let pswd = await UserSchema.findById({ _id: id }).select("-password -profilePic"); //to hide hashed pswd
  
      const accessToken = await savedUserData.genAuthToken();
      res.status(201).json({
        success: true,
        data: pswd,
        token: accessToken,
      })
    } catch (err) {
      res.status(400).json({
        success: false,
        message: err.message,
      });
    }
  };

//upload profile picture

const uploadPfp = async (req, res) => {
    try {
      const buffer = req.file.buffer;
      req.user.profilePic = buffer;
      await req.user.save();
      res.json({
        success: true,
      });
    } catch (err) {
      res.status(500).json({
        success: false,
        message: err.message,
      });
    }
  };


//login user via username, password

const loginUser = async (req, res) => {
    const username = req.body.username;
    const password = req.body.password;
    const user = await UserSchema.findOne({ username: username });
  
    if (!user) {
      return res.status(400).send({ error: "User does not exist..." });
    }

    const withoutPswd = await UserSchema.findOne({ rollNo: rollNo }).select("-password -profilePic");
  
    try {
      if (await bcrypt.compare(password, user.password)) {
        const token = await user.genAuthToken();
        res.json({
          user: withoutPswd,
          token: token,
        });
      } else {
        res.send("Wrong password");
      }
    } catch (e) {
      res.status(500).json({
        success: false,
        message: e.message,
      });
    }
  };


// view food

const viewFood = async (req,res) => {
    try{
        const data = await FoodSchema.find()
        
        res.json({
        success: true,
        data: data
    })
    }catch(e){
        res.json({
            success: false,
            
        })
    }
    
}



  module.exports = {
    createUser,
    uploadPfp
  }

