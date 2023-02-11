const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const foodSchema = new Schema({
    name:{
        type: String,
        required:true
    },
    expiryDate:{
        type: Date,
    },
    isVeg :{ 
        type: Boolean
    },
    provider:{
        type: String
    },
    image: {
        type: Buffer
    }
}, {timestamps: true});

const FoodSchema = mongoose.model("food", foodSchema);
module.exports = FoodSchema;