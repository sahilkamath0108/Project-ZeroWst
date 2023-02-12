const mongoose = require("mongoose");
const Schema = mongoose.Schema;
const validator = require("validator");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
require('dotenv').config();

const providerSchema = new Schema({
    role: {
        type: String,
        default: "provider"
    },
    fname: {
        type: String,
        required: true,
        validate(value){
            if(!validator.isAlpha(value)){
                throw new Error("First name is invalid!");
            }
        }
    },
    lname: {
        type: String,
        required: true,
        validate(value){
            if(!validator.isAlpha(value)){
                throw new Error("First name is invalid!");
            }
        }
    },
    profilePic: {
        type: Buffer
    },
    organization:{
        type: String,
        required: true
    },
    aadharCardNo: {
        type: Number,
        required: true
    },
    longitude:{
        type: Number,
        // required: true
    },
    latitude:{
        type: Number,
        // required: true
    },
    profilePic: {
        type: Buffer
    },
    email: {
        type: String,
        unique: true,
        required: true,
        validate(value){
            if(!validator.isEmail(value)){
                throw new Error("Email is invalid!");
            }
        }
    },
    number: {
        type: Number,
        unique: true,
        required: true,
    },
    password: {
        type: String,
        required: true
    },
    OTP: {
        type: Number,
    },
    isVerified:{
        type: Boolean,
        default: false
    },
    verficationId:{
        type: Number
    },
    food: [{
        type: mongoose.Types.ObjectId,
        ref: 'food'
    }],
    reviews : [{
        type: mongoose.Types.ObjectId,
        ref: 'review'
    }],
    location : [{
        type: Number
    }],
    distance: {
        type: Number
    }

}, {timestamps: true});

//hash the password
providerSchema.pre("save", async function(next){
    try{
        const salt = await bcrypt.genSalt(10)
        const hashedPassword = await bcrypt.hash(this.password, salt)
        this.password = hashedPassword
        next()
    }catch(e){
        console.log(e)
    }
})

providerSchema.methods.genAuthToken = async function(){
    const user = this

    const accessToken = jwt.sign({ _id: user._id.toString() } , process.env.SECRET_KEY)

    return accessToken
}

const ProviderSchema = mongoose.model("provider", providerSchema);
module.exports = ProviderSchema;