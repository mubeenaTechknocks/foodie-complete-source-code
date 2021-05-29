const express = require('express');
const router = express.Router();
const Postsavail = require('../models/Postsavail');

const Postdb = require('../models/Postdb');







//submits a post in postdb schema//deliveryboy
router.post('/',async(req,res)=>{
    
    
    const postsdb = new Postdb({
        deliveryboy_name: req.body.deliveryboy_name,
        deliveryboy_address: req.body.deliveryboy_address,
        deliveryboy_total_order: req.body.deliveryboy_total_order,
        deliveryboy_order_no: req.body.deliveryboy_order_no,
        
        
    });
    try{
    
    const savedPost = await postsdb.save();
        res.json(savedPost);
    }catch (err){
        res.json({ message: err });
    }
    });


    
    


module.exports = router;