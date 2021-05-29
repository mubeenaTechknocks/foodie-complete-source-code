const express = require('express');

const router = express.Router();
const Restaurant = require('../models/Restaurant');


//get back all the posts
router.get('/', async (req, res) => {
     try{
        const restaurants = await Restaurant.find();
        res.json(restaurants);
     }catch(err){
         res.json({message:err});
     }
});

//POST OPERATION
router.post('/', async (req,res) =>{
    console.log(req.body);
    const restaurants = new Restaurant({
        restaurantname: req.body.restaurantname,
        deliveredorders: req.body.deliveredorders,
        pendingorders: req.body.pendingorders,
    });

    try{

        const savedRestaurant = await restaurants.save();
        return res.json(savedRestaurant);
       }
       catch (err) {
        res.json({ message: err });
       }
    });

       module.exports = router;