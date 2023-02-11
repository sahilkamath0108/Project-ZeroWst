require("dotenv").config()

const ProviderSchema = require("../models/providerSchema")
const FoodSchema = require("../models/foodSchema")

const bcrypt = require("bcryptjs")
const nodemailer = require("nodemailer")
const otpGenerator = require("otp-generator")
const multer = require("multer")
const ProviderSchema = require("../models/providerSchema")

let mailTransporter = nodemailer.createTransport({
    service: "gmail",
    auth: {
      provider: process.env.EMAIL,
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

const createProvider = async (req, res) => {
    try {
      let providerData = new ProviderSchema(req.body);
      let savedProviderData = await providerData.save();
      let id = savedProviderData._id;
      providerMail = savedProviderData.email;
  
      mailTransporter.sendMail({
        from: process.env.EMAIL,
        to: providerMail,
        subject:"Thank you for creating an account " +savedProviderData.fname,
        text: "We hope you have a good time with our app.",
      });
  
      let pswd = await ProviderSchema.findById({ _id: id }).select("-password -profilePic"); //to hide hashed pswd
  
      const accessToken = await savedProviderData.genAuthToken();
      res.status(201).json({
        success: true,
        data: pswd,
        message: "Waiting for verification from admin"
      })
    } catch (err) {
      res.status(400).json({
        success: false,
        message: err.message,
      });
    }
  };


//login provider

const loginProvider = async (req, res) => {
    try{
        const email = req.body.email
    const password = req.body.password;
    const provider = await ProviderSchema.findOne({ email: email });
  
    if (!provider) {
      return res.status(400).send({ error: "provider does not exist..." });
    }else if( !provider.isVerified){
        return res.send({ error : "Admin has not yet verified, please wait for some time"})
    }else{

    const withoutPswd = await ProviderSchema.findOne({ rollNo: rollNo }).select("-password -profilePic");
  
    try {
      if (await bcrypt.compare(password, provider.password)) {
        const token = await provider.genAuthToken();
        res.json({
          provider: withoutPswd,
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
}
}catch(e){
    res.json({
        success: false,
        message: e.message
    })
}
  };



module.exports = {
    createProvider
}