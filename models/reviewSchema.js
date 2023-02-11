const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const reviewSchema = new Schema({
    reviewBy:{
        type: String
    },
    reviewFor:{
        type: String,
        required: true
    },
    review:{
        type: String
    },
    response:{
        type: String
    }
})

const ReviewSchema = mongoose.model("review", reviewSchema);
module.exports = ReviewSchema;