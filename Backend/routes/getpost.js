const express = require('express');
const router = express.Router();


const PostOf = require('../models/PostOf');

    //gets all posts in postof schema 
router.get('/',async(req,res)=>{
    
    try{
    
    const getposts = await PostOf.find();
    res.json(getposts);
    }catch (err){
        res.json({ message: err });
    }
    });

//gets a post in postof schema
router.get('/:postId',async(req,res)=>{
    
    try{
    
    const getposts = await PostOf.findById(req.params.postId);
    res.json(getposts);
    }catch (err){
        res.json({ message: err });
    }
    });


    

    


module.exports = router;