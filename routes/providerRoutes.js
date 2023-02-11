const express = require("express")

const providerC = require("../controllers/providerC")
const auth = require("../middleware/auth")

const router = express.Router()



//create provider

router.post("/new", providerC.createProvider)

//upload profile picture

router.post("/uploadPfp", auth.authToken , providerC.fileVerifyPfp.single('pfp'), providerC.uploadPfp )

//login provider

router.post("/login", providerC.loginprovider)

//add food

router.post("/addFood", auth.authToken, providerC.addFood)

// delete provider

router.delete("/delete", auth.authToken ,providerC.deleteprovider)

//updating provider info

router.put("/update", auth.authToken ,providerC.updateprovider)

//forgot password

// router.post("/forgotPassword", providerC.forgotPswd)

//get otp

// router.post("/getOTP", providerC.loginOTP)

//login via OTP

// router.post("/loginOTP", auth.verifyOTP ,providerC.verifyOTP)

//view food

router.get("/viewFood", auth.authToken, providerC.viewFood)

//view providers

router.get("/viewProvider", auth.authToken, providerC.viewProvider)

//payment

// router.post("/pay", auth.authToken, )

module.exports = router

