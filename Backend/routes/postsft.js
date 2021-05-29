const express = require('express');
const router = express.Router();

const Postft = require('../models/Postft');


//submits a post in postft schema//foodtype
router.post('/',async(req,res)=>{
    
    
    const postsdbft = new Postft({
       food_type: req.body.food_type,
       
        
        
    });
    try{
    
    const savedPost = await postsft.save();
        res.json(savedPost);
    }catch (err){
        res.json({ message: err });
    }
    });

    

    


module.exports = router;