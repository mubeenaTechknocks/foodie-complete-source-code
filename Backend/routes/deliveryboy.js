const express = require('express');
const Deliveryboy = require('../models/Deliveryboy')

const router = express.Router();



//get back all the posts
router.get('/', async (req, res) => {
     try{
        const deliveryboy = await Deliveryboy.find();
        res.json(deliveryboy);
     }catch(err){
         res.json({message:err});
     }
});

//POST OPERATION
router.post('/', async (req,res) =>{
    console.log(req.body);
    const deliveryboy = new Deliveryboy({
        email: req.body.email,
        password: req.body.password,
       
        name: req.body.name,
        age: req.body.age,
        phone: req.body.phone,
        bloodGroup: req.body.bloodGroup,
        houseName: req.body.houseName,
        postOffice: req.body.postOffice,
        city: req.body.city,
        pincode: req.body.pincode,
        licenceNo: req.body.licenceNo,
        vehicleModel: req.body.vehicleModel,
        vehicleColor: req.body.vehicleColor,
        regNo: req.body.regNo,
    
    });

    try{

        const savedDeliveryboy = await deliveryboy.save();
        return res.json(savedDeliveryboy);
       }
       catch (err) {
        res.json({ message: err });
       }
    });

       module.exports = router;