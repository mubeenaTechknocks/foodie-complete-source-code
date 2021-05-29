const express = require('express');
const router = express.Router();
// const Post = require('../models/Post');
const multer = require('multer');
const Banner = require('../models/Banner');



const storage = multer.diskStorage({
  destination: function(req, file, cb){
    cb(null, './uploads/');
  },  
    filename: function(req,file,cb){
     cb(null,file.originalname);
    }
});

const upload = multer({storage: storage});


router.get('/',(req,res)=>{   //REMOVER VERIFY TO ACCESS IT EVERYWHERE OR U NEED AUTHTOKEN
    Banner.find({}).then(data=>{
        res.send(data)
    }).catch(err=>{
        console.log(err)
    })
    
    
})



//upload an image
router.post("/",upload.single('banner'),async(req,res)=>{
    console.log(req.file)
    const banner = new Banner({
        title: req.body.title,
        description: req.body.description,
        
       banner: req.file.path
    });
    res.send(req.file);
    try{
    
    const savedBanner = await banner.save();
        res.json(savedBanner);
    }catch (err){
        res.json({ message: err });
    }
    });






module.exports = router;