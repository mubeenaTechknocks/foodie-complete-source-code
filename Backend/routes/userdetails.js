const express = require('express');
const Userdetails = require('../models/Userdetails');
const router = require('express').Router();
const Subadmin = require('../models/Userdetails');

//GET
router.get('/', async  (req, res, next) => {
   try{
      const userdetails = await Userdetails.find();
     res.json(userdetails);
     }catch(err){
      return res.json({ message:err });
  }
   });

   ///POST
router.post('/', async  (req, res) => {
    const userdetails = new Userdetails({
         name: req.body.name,
         email: req.body.email,
         phone: req.body.phone,
        });
        try{
         const savedUserdetails = await userdetails.save()
        res.json(savedUserdetails);
        }catch(err){
            res.json({message: err});
        }
    });





    //Delete Post
router.delete('/:userdetailsId' , async (req,res) => {
    try{
        const removedUserdetails = await Userdetails.remove({_id: req.params.userdetailsId});
       res.json(removedUserdetails);
    }catch(err){
        return res.json({ message:err });
    }
});
        
 

    //update post
router.patch('/:userdetailsId', async (req,res) => {
    try{
        const updatedUserdetails = await Userdetails.updateOne(
        { _id: req.params.userdetailsId},
        {$set: { name: req.body.name} }
        );
        res.json(updatedUserdetails)
    }catch(err){
        return res.json({ message:err });
    }
});   
    


        
       
      
    
    module.exports = router;