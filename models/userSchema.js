const mongoose = require("mongoose");
const Schema = mongoose.Schema;
const validator = require("validator");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
require('dotenv').config();

const userSchema = new Schema({
    role: {
        type: String,
        default: "user"
    },
    // username: {
    //     type: String,
    //     required: true,
    //     unique: true
    // },
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
        required: true
    },
    password: {
        type: String,
        required: true
    },
    OTP: {
        type: Number,
    },
    foodBought : [{
        type : mongoose.Types.ObjectId,
        ref: 'food'
    }],
    reviews : [{
        type: mongoose.Types.ObjectId,
        ref: 'review'
    }]

}, {timestamps: true});

//hash the password
userSchema.pre("save", async function(next){
    try{
        const salt = await bcrypt.genSalt(10)
        const hashedPassword = await bcrypt.hash(this.password, salt)
        this.password = hashedPassword
        next()
    }catch(e){
        console.log(e)
    }
})

userSchema.methods.genAuthToken = async function(){
    const user = this

    const accessToken = jwt.sign({ _id: user._id.toString() } , process.env.SECRET_KEY)

    return accessToken
}

const UserSchema = mongoose.model("user", userSchema);
module.exports = UserSchema;