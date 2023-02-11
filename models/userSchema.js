

const userSchema = new Schema({
    role: {
        type: String,
        default: "provider"
    },
    username: {
        type: String,
        required: true,
        unique: true
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
    restaurant:{
        name : {
            type: String
        },
        latitude: {
            type: String
        },
        longitude: {
            type: String
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
        required: true,
        // validate(value){
        //     if(!validator.isMobilePhone(value)){
        //         throw new Error("Number is invalid!");
        //     }
        // }
    },
    password: {
        type: String,
        required: true
    },
    OTP: {
        type: Number,
    }

}, {timestamps: true});