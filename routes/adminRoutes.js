const express = require("express")

const adminC = require("../controllers/adminC")
const providerC = require("../controllers/providerC")
const auth = require("../middleware/auth")

const router = express.Router()

//create admin

router.post("/new", adminC.createAdmin)

//upload profile picture

router.post("/uploadPfp", auth.authToken , adminC.fileVerifyPfp.single('pfp'), adminC.uploadPfp )

//get providers

router.get("/allProviders", auth.authToken ,auth.authRole("admin") ,adminC.getProviders)

//get particular provider

router.post("/provider/:id", auth.authToken, auth.authRole("admin"), adminC.oneProvider)

// verification of provider

router.post("/verify/:id", adminC.verifyProvider)

//get users

router.get("/allUsers", auth.authToken, auth.authRole("admin"), adminC.getUsers)


module.exports = router
