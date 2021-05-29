const express = require('express');
const router = require('express').Router();
const Userapppost = require('../models/Userapppost');

router.get('/', async  (req, res, next) => {
    try{
       const userapppost = await Userapppost.find();
      res.json(userapppost);
      }catch(err){
       return res.json({ message:err });
   }
    });
    
    router.post('/',async (req, res) => {
        const userapppost = new Userapppost({
            Item: req.body.Item,
            Price: req.body.Price,
            Quantity: req.body.Quantity,
            Payment: req.body.Payment,
            Name: req.body.Name,
            Contactnumber:req.body.Contactnumber,
            Addressline1: req.body.Addressline1,
            Addressline2: req.body.Addressline2,
            Pincode: req.body.Pincode,
            City: req.body.City,
            State: req.body.State,
            Orderprice: req.body.Orderprice,
            Deliverycharges: req.body.Deliverycharges,
            Tax: req.body.Tax,
            Total: req.body.Total
        });
        try{
         const savedUserapppost = await userapppost.save()
        res.json(savedUserapppost);
        }catch(err){
            res.json({message: err});
        }
    });

    module.exports = router;