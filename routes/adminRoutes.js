const express = require("express")

const adminC = require("../controllers/adminC")
const providerC = require("../controllers/providerC")
const auth = require("../middleware/auth")

const router = express.Router()