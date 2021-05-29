const express = require('express');
const router = express.Router();

const PostOf = require('../models/PostOf');

    //submits a post in postof schema//ordersdetails
router.post('/',async(req,res)=>{
    
    
    const postsof = new PostOf({
        order_recieved: req.body.order_recieved,
        
        
        
    });
    try{
    
    const savedPost = await postsof.save();
        res.json(savedPost);
    }catch (err){
        res.json({ message: err });
    }
    });
    

    


module.exports = router;