const express = require('express');
const router = express.Router();

const Postf = require('../models/Postf');



    //submits a post in postf schema//offercoupon
router.post('/',async(req,res)=>{
    
    
    const postsf = new Postf({
        offer_percent: req.body.offer_percent,
        offer_name: req.body.offer_name,
        
        
    });
    try{
    
    const savedPost = await postsf.save();
        res.json(savedPost);
    }catch (err){
        res.json({ message: err });
    }
    });

    

    


module.exports = router;