require("dotenv").config()

const UserSchema = require("../models/userSchema")
const FoodSchema = require("../models/foodSchema")
const ReviewSchema = require("../models/reviewSchema")

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
        error: err.message,
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
        error: err.message,
      });
    }
  };


//login user via email, password

const loginUser = async (req, res) => {
    const email = req.body.email;
    const password = req.body.password;
    const user = await UserSchema.findOne({ email: email });
  
    if (!user) {
      return res.status(400).send({ error: "User does not exist..." });
    }

    const withoutPswd = await UserSchema.findOne({ email: email }).select("-password -profilePic");
  
    try {
      if (await bcrypt.compare(password, user.password)) {
        const token = await user.genAuthToken();
        res.json({
          user: withoutPswd,
          token: token,
        });
      } else {
        res.status(400).json({
          error : "Wrong password"
        });
      }
    } catch (e) {
      res.status(500).json({
        success: false,
        error: e.message,
      });
    }
  };


// view food

const viewFood = async (req,res) => {
    try{
        const data = await FoodSchema.find().sort({ createdAt: -1 })
        
        res.json({
        success: true,
        data: data
    })
    }catch(e){
        res.json({
            success: false,
            error: e.message
        })
    }
}

// view providers

const viewProvider = async (req,res) => {
    try{
        const data = await ProviderSchema.find().populate('food')

        res.status(200).json({
            success : true,
            data : data
        })
    }catch(e){
        res.json({
            success: false,
            error: e.message
        })
    } 
}

//delete user

const deleteUser = async (req, res) => {
    try {

      let id = req.user._id;
  
      const user = await UserSchema.findByIdAndDelete({ _id: id });
      const userMail = user.email;
  
      if (!user) {
        res.status(404).json({
          success: false,
          error: "User not found",
        });
      } else {
  
        mailTransporter.sendMail({
          from: process.env.EMAIL,
          to: userMail,
          subject: "Sorry to see you leave " + user.fname,
          text: "We do hope you come back, we will be waiting for you! Thank you",
        });
  
        res.status(200).json({
          success: true,
          error: "User was deleted",
          data: user,
        });
      }
    } catch (e) {
      res.status(400).json({
        success: false,
        error: e.message,
      });
    }
  };

  //updating user

const updateUser = async (req, res) => {

    let email = req.user.email;
  
    const updates = Object.keys(req.body);
    const allowedUpdates = ["fname", "lname", "number", "password"];
    const isValidOperation = updates.every((update) =>
      allowedUpdates.includes(update)
    );
  
    if (!isValidOperation) {
      return res.status(400).send({ error: "Invalid Updates!" });
    }
  
    let user = await UserSchema.findOne({ email: email});
  
    if (!user) {
      res.status(404).json({
        success: false,
        error: "User not found",
      });
    } else {
      try {
        await UserSchema.findOneAndUpdate({ email: email },{ $set: req.body })
  
        const salt = await bcrypt.genSalt(10);
        const hashedPassword = await bcrypt.hash(req.body.password, salt);
        let newPswd = await UserSchema.findOneAndUpdate({ email: email },{ password: hashedPassword })
  
        
        res.status(201).json({
          success: true,
          data: req.body,
        });
      } catch (err) {
        res.status(500).json({
          success: false,
          error: err.message,
        });
      }
    }
  };

//buy food

const buyFood = async (req,res) => {

  try{
    const foodId = req.params.id
    const userId = req.user._id

    const user = await UserSchema.findByIdAndUpdate({_id : userId}, {$push: {foodBought : foodId}} )

    const food = await FoodSchema.findOne({_id : foodId})

    if(food.stock>1){
      await FoodSchema.updateOne({_id : foodId}, {$inc : {stock : -1}})
    }else if(food.stock == 1){
      await FoodSchema.updateOne({_id : foodId}, {$inc : {stock : -1}})
      await FoodSchema.updateOne({_id : foodId}, {available : false})
    }

    

    res.json({
      success: true,
      message: "Food bought",
      data: food
    })
  }catch(e){
    res.json({
      success: false,
      error: e.message
    })
  }
}

//view history

const history = async (req,res) => {
  try{
  const userId = req.user._id
  const user = await UserSchema.findById({ _id : userId}).populate("foodBought")
  
  res.json({
    success: true,
    data: user.foodBought
  })
  }catch(e){
    res.json({
      success: false,
      error: e.message
    })
  }
  
}

//post review

const review = async (req,res) => {
  try{
  const organization = req.body.organization
  const reviewer = req.user
  
  const review = new ReviewSchema(req.body)
  const savedReview = await review.save()
  savedReview.reviewBy = reviewer.email

  await UserSchema.findOneAndUpdate({email: reviewer._id}, {$push : { reviews : savedReview._id}})
  await ProviderSchema.findOneAndUpdate({organization: organization}, {$push : { reviews : savedReview._id}})

  mailTransporter.sendMail({
    from: process.env.EMAIL,
    to: organization.email,
    subject:"A user has reviewed your Organization",
    text: reviewer.fname + " has reviewed your place. They say " + review.review,
  });

  res.status(201).json({
    success: true,
    message: "Review posted"
  })
}catch(e){
  res.json({
    success: false,
    error: e.message
  })
}

}



  module.exports = {
    createUser,
    uploadPfp,
    viewFood,
    viewProvider,
    fileVerifyPfp,
    loginUser,
    deleteUser,
    updateUser,
    buyFood,
    history,
    review
  }

