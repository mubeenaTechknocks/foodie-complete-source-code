const express = require('express');
const router = express.Router();
const Postsavail = require('../models/Postsavail');





//submits a post in postavail schema//food available
router.post('/',async(req,res)=>{
    
    
const postsavail = new Postsavail({
    available_food_name: req.body.available_food_name,
    available_food_count: req.body.available_food_count,
    
    
});
try{

const savedPostsavail = await postsavail.save();
    res.json(savedPostsavail);
}catch (err){
    res.json({ message: err });
}
});



    

    


module.exports = router;