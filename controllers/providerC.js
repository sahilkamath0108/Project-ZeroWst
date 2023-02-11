require("dotenv").config()

const ProviderSchema = require("../models/providerSchema")
const FoodSchema = require("../models/foodSchema")

const bcrypt = require("bcryptjs")
const nodemailer = require("nodemailer")
const otpGenerator = require("otp-generator")
const multer = require("multer")

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


//add food

const addFood = async (req,res) => {

    try{
    let foodData = new FoodSchema(req.body)
    let savedFoodData = await foodData.save()
    let foodId = savedFoodData._id
    let providerId = req.user._id

    const provider = ProviderSchema.findById({_id : providerId})

    savedFoodData.provider = provider.organization

    await ProviderSchema.findByIdAndUpdate({ _id : providerId}, {$push: {food : foodId}})

    res.status(201).json({
        success: true,
        message: "Food item added",
        data: savedFoodData,
      })
    }catch(e){
        res.json({
            success: false,
            message: e.message
        })
    }
    }
//delete food

const deleteFood = async(req,res) => {
    try{
        const foodId = req.params.id
        const food = await FoodSchema.deleteOne({_id : foodId})

        res.status(200).json({
            success: true,
            message: "Food item deleted",
            data: food
        })
    }catch(e){
        res.json({
            success: false,
            message: e.message
        })
    }
}


//delete provider

const deleteProvider = async (req,res) => {
    try{
        const id = req.user._id
        const provider =  await ProviderSchema.findByIdAndDelete({ _id : id})

        await FoodSchema.deleteMany({ provider : provider.organization})

        res.status(200).json({
            success: true,
            message: "Provider and their food items deleted",
            data: provider
        })
    }catch(e){
        res.json({
            success : false,
            message: e.message
        })
    }
    

    
}

//update provider

const updateProvider = async (req, res) => {

    let email = req.user.email
  
    const updates = Object.keys(req.body);
    const allowedUpdates = ["fname", "lname", "number", "password","latitude","longitude"];
    const isValidOperation = updates.every((update) =>
      allowedUpdates.includes(update)
    );
  
    if (!isValidOperation) {
      return res.status(400).send({ error: "Invalid Updates!" });
    }
  
    let provider = await ProviderSchema.findOne({ email : email });
  
    if (!provider) {
      res.status(404).json({
        success: false,
        message: "Provider not found",
      })
    } else {
      try {
        await ProviderSchema.findOneAndUpdate({ email: email },{ $set: req.body })
  
        const salt = await bcrypt.genSalt(10);
        const hashedPassword = await bcrypt.hash(req.body.password, salt);
        let newPswd = await UserSchema.findOneAndUpdate({email: email },{ password: hashedPassword })
  
        
        res.status(201).json({
          success: true,
          data: req.body,
        });
      } catch (err) {
        res.status(500).json({
          success: false,
          message: err.message,
        });
      }
    }
  };



module.exports = {
    createProvider,
    loginProvider,
    uploadPfp,
    fileVerifyPfp,
    addFood,
    deleteProvider,
    updateProvider,
    deleteFood
}