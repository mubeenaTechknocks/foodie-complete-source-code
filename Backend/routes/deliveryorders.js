const express = require('express');
const Deliveryorder = require('../models/Deliveryorder');
const router = require('express').Router();
const Order = require('../models/Deliveryorder');

router.get('/', async  (req, res, next) => {
    try{
       const orders = await Order.find();
      res.json(orders);
      }catch(err){
       return res.json({ message:err });
   }
    });
    
    router.post('/',async (req, res) => {
        const order = new Order({
            Orderdate: req.body.Orderdate,
            Hotelsname: req.body.Hotelsname,
            Orderamount: req.body.Orderamount,
            Payment: req.body.Payment,
            Address: req.body.Address,
            Item: req.body.Item,
            Price: req.body.Price,
            Quantity: req.body.Quantity,
            Name: req.body.Name,
            Phonenumber:req.body.Phonenumber,
            Orderprice: req.body.Orderprice,
            Deliverycharges: req.body.Deliverycharges,
            Tax: req.body.Tax,
            Total: req.body.Total
        });
        try{
         const savedOrder = await order.save()
        res.json(savedOrder);
        }catch(err){
            res.json({message: err});
        }
    });

    ////dlt post
    router.delete('/:postId' , async (req,res) => {
        try{
            const removedDeliveryorder = await Deliveryorder.remove({_id: req.params.postId});
           res.json(removedDeliveryorder);
        }catch(err){
            return res.json({ message:err });
        }
    });

    module.exports = router;