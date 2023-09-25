
// to exit from npm nodemon ctrl+c
// "nodemon run dev" file runs using nodemod, whenever files get save its auto-restart it.

// IMPORT FROM PACKAGE
const express = require("express");
const mongoose = require("mongoose");

//IMPORT FROM FILES
const authRouter = require("./server_routes/auth");

//INIT
const PORT = 3000;
const app = express();
const DB = "mongodb+srv://anuraggupta:anuragappinventiv@cluster0.jbirind.mongodb.net/?retryWrites=true&w=majority&appName=AtlasApp";

// MIDDLE-WARE
app.use(express.json());
app.use(authRouter);


//CNNECTIONS
mongoose.connect(DB).then(()=>{
    console.log("connection success!");
}).catch((e)=>{console.log(e);});


app.listen(PORT,"0.0.0.0",()=>{
    console.log(`Connected to ${PORT}`);
});