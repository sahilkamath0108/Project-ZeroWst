const express = require("express")

const providerC = require("../controllers/providerC")
const auth = require("../middleware/auth")

const router = express.Router()



//create provider

router.post("/new", providerC.createProvider)

//upload profile picture

router.post("/uploadPfp", auth.authToken , providerC.fileVerifyPfp.single('pfp'), providerC.uploadPfp )

//login provider

router.post("/login", providerC.loginProvider)

// add food

router.post("/addFood", auth.authToken, providerC.addFood)

//delete food

router.post("/deleteFood/:id", auth.authToken, providerC.deleteFood)

// delete provider

router.delete("/delete", auth.authToken ,providerC.deleteProvider)

//updating provider info

router.put("/update", auth.authToken ,providerC.updateProvider)

//get all food

router.get("/getFood", auth.authToken, providerC.viewFood)

//forgot password

// router.post("/forgotPassword", providerC.forgotPswd)

//get otp

// router.post("/getOTP", providerC.loginOTP)

//login via OTP

// router.post("/loginOTP", auth.verifyOTP ,providerC.verifyOTP)

//view food

// router.get("/viewFood", auth.authToken, providerC.viewFood)

// //view providers

// router.get("/viewProvider", auth.authToken, providerC.viewProvider)


module.exports = router

