const express = require("express")

const userC = require("../controllers/userC")
const auth = require("../middleware/auth")

const router = express.Router()



//create user

router.post("/new", userC.createUser)

//upload profile picture

router.post("/uploadPfp", auth.authToken , auth.fileVerifyPfp.single('pfp'), userC.uploadPfp )

//login user

router.post("/login", userC.loginUser)

//delete user

// router.delete("/delete", auth.authToken ,userC.deleteUser)

//updating user info

// router.put("/update", auth.authToken ,userC.updateUser)

//forgot password

router.post("/forgotPassword", userC.forgotPswd)

//get otp

router.post("/getOTP", userC.loginOTP)

//login via OTP

router.post("/loginOTP", auth.verifyOTP ,userC.verifyOTP)

//view food

router.get("/viewFood", auth.authToken, userC.)

//view providers

router.get("/viewProvider", auth.authToken, userC.)

//payment

router.post("/pay", auth.authToken, )

module.exports = router

