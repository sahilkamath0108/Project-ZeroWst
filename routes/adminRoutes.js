const express = require("express")

const adminC = require("../controllers/adminC")
const providerC = require("../co")
const auth = require("../middleware/auth")

const router = express.Router()