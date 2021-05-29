const express = require('express');
const Homescreen = require('../models/Homescreen');
const router = require('express').Router();


//GET
router.get('/', async  (req, res, next) => {
   try{
      const homescreen = await Homescreen.find();
     res.json(hoteldetails);
     }catch(err){
      return res.json({ message:err });
  }
   });

   ///POST
router.post('/', async  (req, res) => {
    const homescreen = new Homescreen({
         hotelsname: req.body.hotelsname,
         item: req.body.item,
         price: req.body.price,
         openingtime: req.body.openingtime,
         closingtime: req.body.closingtime,
         status: req.body.status,
        
        });
        try{
         const savedHomescreen = await homescreen.save()
        res.json(savedHomescreen);
        }catch(err){
            res.json({message: err});
        }
        
       
      
    })

        //Delete Post
router.delete('/:postId' , async (req,res) => {
    try{
        const removedHomescreen = await Homescreen.remove({_id: req.params.postId});
       res.json(removedHomescreen);
    }catch(err){
        return res.json({ message:err });
    }
});



//update post
router.patch('/:homescreenId', async (req,res) => {
    try{
        const updatedHomescreen = await Homescreen.updateOne(
        { _id: req.params.homescreenId},
        {$set: { hotelsname: req.body.hotelsname} }
        );
        res.json(updatedHomescreen)
    }catch(err){
        return res.json({ message:err });
    }
});   
    module.exports = router;