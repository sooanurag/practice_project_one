const mongoose = require("mongoose");

const userSchema = mongoose.Schema({
    name:{
        required:true,
        type:String,
        trim:true,
    },
    email:{
        required:true,
        type:String,
        trim:true,
        validate:{
            validator:(value)=>{
                const re = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/u;
                return value.match(re);
            },
            message: "Please enter a valid email address!",
        }
    },
    password:{
        required:true,
        type:String,
        validate:{
            validator:(value)=>{
                return value.length > 6;
            },
            message : "Password must be greater than six characters!"
        }
    },
    address:{
        type:String,
        default: "",
    },
    type:{
        type: String,
        default:"user",
    },
});

const User = mongoose.model('User',userSchema);
module.exports = User;