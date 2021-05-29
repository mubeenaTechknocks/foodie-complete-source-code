const express = require('express');
const router = express.Router();

const Postdbreg = require('../models/Postdbreg');







//submits a post in postdbreg schema//deliveryboy registration details
router.post('/',async(req,res)=>{
    
    
    const postsdbreg = new Postdbreg({
        deliveryboy_name: req.body.deliveryboy_name,
        deliveryboy_address: req.body.deliveryboy_address,
        deliveryboy_age: req.body.deliveryboy_age,
        deliveryboy_vehicle_type: req.body.deliveryboy_vehicle_type,
        deliveryboy_vehicle_name: req.body.deliveryboy_vehicle_name,
        deliveryboy_vehicle_color:req.body.deliveryboy_vehicle_color,
        deliveryboy_plate_no: req.body.deliveryboy_plate_no,
        deliveryboy_license_no: req.body.deliveryboy_license_no,
        
    });
    try{
    
    const savedPost = await postsdbreg.save();
        res.json(savedPost);
    }catch (err){
        res.json({ message: err });
    }
    });


    
    


module.exports = router;