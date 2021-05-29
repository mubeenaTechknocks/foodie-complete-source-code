const express = require('express');
const Prepairing = require('../models/Prepairing');
const router = express.Router();
// const Post = require('../models/Post');
const multer = require('multer');




const storage = multer.diskStorage({
  destination: function(req, file, cb){
    cb(null, './uploads/');
  },  
    filename: function(req,file,cb){
     cb(null,file.originalname);
    }
});

const upload = multer({storage: storage});






router.get('/',(req,res)=>{ 
    Prepairing.find({}).then(data=>{
        res.send(data)
    }).catch(err=>{
        console.log(err)
    })
    
    
})



//upload an image
router.post("/",upload.single('prepairing'),async(req,res)=>{
    console.log(req.file)
    const prepairing = new Prepairing({
        orderdate: req.body.orderdate,
    payment: req.body.payment,
    address: req.body.address,
    item: req.body.item,
    name: req.body.name,
    phno: req.body.phno,
        
       prepairing: req.file.path
    });
    res.send(req.file);
    try{
    
    const savedPrepairing = await prepairing.save();
        res.json(savedPrepairing);
    }catch (err){
        res.json({ message: err });
    }
    });

// //submits a post
// router.post("/",async(req,res)=>{
    
// const prepairing = new Prepairing({
//     orderdate: req.body.orderdate,
//     payment: req.body.payment,
//     address: req.body.address,
//     item: req.body.item,
//     name: req.body.name,
//     phno: req.body.phno,
// });
// try{

// const savedPrepairing = await prepairing.save();
//     res.json(savedPrepairing);
// }catch (err){
//     res.json({ message: err });
// }
// });

module.exports = router;