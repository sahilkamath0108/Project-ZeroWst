require("dotenv").config()

const UserSchema = require("../models/userSchema")
const FoodSchema = require("../models/foodSchema")
const AdminSchema = require("../models/adminSchema")

const bcrypt = require("bcryptjs")
const nodemailer = require("nodemailer")
const otpGenerator = require("otp-generator")
const multer = require("multer")
const ProviderSchema = require("../models/providerSchema")

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

//create admin

const createAdmin = async (req, res) => {
    try {
      let adminData = new AdminSchema(req.body);
      let savedAdminData = await adminData.save();
      let id = savedAdminData._id;
      adminMail = savedAdminData.email;
  
      mailTransporter.sendMail({
        from: process.env.EMAIL,
        to: adminMail,
        subject:"Thank you for creating an account " +savedAdminData.fname,
        text: "We hope you have a good time with our app.",
      });
  
      let pswd = await AdminSchema.findById({ _id: id }).select("-password -profilePic"); //to hide hashed pswd
  
      const accessToken = await savedAdminData.genAuthToken();
      res.status(201).json({
        success: true,
        data: pswd,
        token: accessToken,
      })
    } catch (err) {
      res.status(500).json({
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

//login admin

const loginAdmin = async (req, res) => {
    try{
    const email = req.body.email
    const password = req.body.password;
    const admin = await AdminSchema.findOne({ email: email });
  
    if (!admin) {
      return res.status(400).send({ error: "Admin does not exist..." });
    }

    const withoutPswd = await AdminSchema.findOne({ rollNo: rollNo }).select("-password -profilePic");
  
      if (await bcrypt.compare(password, admin.password)) {
        const token = await admin.genAuthToken();
        res.json({
          admin: withoutPswd,
          token: token,
        });
      } else {
        res.status(400).json({
          error : "Wrong password"
        });
    }
  }catch(e){
    res.json({
        success: false,
        error: e.message
    })
}
  };

//get all providers

const getProviders = async (req,res) => {
    try{
        const data1 = await ProviderSchema.find({isVerified: false}).populate("food")
        const data2 = await ProviderSchema.find({isVerified: true}).populate("food")

        res.status(200).json({
            success: true,
            unVerified: data1,
            verified : data2
        })
    }catch(e){
        res.json({
            success: false,
            error : e.message
        })
    }
}

//get one provider

const oneProvider = async (req,res) => {
    try{
        const providerId = req.params.id
        const provider = await ProviderSchema.findById({ _id: providerId}).populate("food")

        res.status(200).json({
            success: true,
            provider: provider,
        })
    }catch(e){
        res.json({
            success: false,
            error : e.message
        })
    }
}

//verification of provider

const verifyProvider = async (req,res) => {
    try{
        const providerId = req.params.id
        const provider = await ProviderSchema.findByIdAndUpdate({ _id: providerId}, { isVerified: true})

        res.status(200).json({
            success:true,
            message: provider.organization + " has been verified"
        })

    }catch(e){
        res.json({
          success: false,
          error: err.message,
        })
    }
}

//get all users

const getUsers = async (req,res) => {
    try{
        const userData = await UserSchema.find().populate("foodBought")

        res.status(200).json({
            success: true,
            users: data1
        })
    }catch(e){
        res.json({
            success: false,
            error : e.message
        })
    }
}


module.exports = {
    createAdmin,
    uploadPfp,
    fileVerifyPfp,
    getProviders,
    getUsers,
    oneProvider,
    verifyProvider
}