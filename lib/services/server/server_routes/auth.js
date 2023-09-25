//CRUD
// http://<youipaddress>/endpoint
//from req=> can get request's meta data and in res=> we pass data response
// "/" root end point


const express = require("express");
const bcryptjs = require("bcryptjs");
const User = require('../models/user_model');

const authRouter = express.Router();

authRouter.post("/api/signup", async (req,res)=>{
    try{const {name,email,password} = req.body;
    const existingUser = await User.findOne({email});
    if(existingUser){
        return res.status(400).json({msg:"user exists in db!"});
    }

    const hashedPassword = await bcryptjs.hash(password,8);

    let user = new User({
        email,
        name,
        password: hashedPassword,
    })
    user = await user.save();
    res.json(user);}
    catch(e){res.status(500).json({error: e.message});}
});

module.exports = authRouter;