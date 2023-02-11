const express = require("express")

const userC = require("../controllers/userC")
const auth = require("../middleware/auth")

const router = express.Router()



//create user

router.post("/new", userC.createUser)

//upload profile picture

router.post("/uploadPfp", auth.authToken , userC.fileVerifyPfp.single('pfp'), userC.uploadPfp )

//login user

router.post("/login", userC.loginUser)

// delete user

router.delete("/delete", auth.authToken ,userC.deleteUser)

//updating user info

router.put("/update", auth.authToken ,userC.updateUser)

//buy food

router.post("/buy/:id", auth.authToken, userC.buyFood)

//history

router.get("/history", auth.authToken, userC.history)

//put a review

router.post("/review", userC.review)

//view Food

router.get("/viewFood", auth.authToken, userC.viewFood)

//view providers

router.get("/viewProvider", auth.authToken, userC.viewProvider)

//payment

// router.post("/pay", auth.authToken, )

module.exports = router

