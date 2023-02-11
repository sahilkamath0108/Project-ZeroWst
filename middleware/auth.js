require("dotenv").config()
const jwt = require("jsonwebtoken")
const UserSchema = require("../models/userSchema")
const ProviderSchema = require("../models/providerSchema")

let auth = {
    authTokenUser: async (req, res, next) => {
      try {
        const authHeader = req.header("Authorization");
        const token = authHeader && authHeader.split(" ")[1];
        if (token == null) return res.sendStatus(401);
  
        const decode = jwt.verify(token, process.env.SECRET_KEY);
        const user = await UserSchema.findById({ _id: decode._id });
  
        if (!user) {
          const provider = await ProviderSchema.findById({ _id: decode._id });
          if (!provider) {
            res.status(404).json({
              error: "Wrong credentials",
            });
          }
          req.user = provider;
          next();
        } else {
          req.user = user;
          next();
        }
      } catch (e) {
        res.status(401).json({
          success: false,
          message: e.message,
        });
      }
    },
}


module.exports = auth