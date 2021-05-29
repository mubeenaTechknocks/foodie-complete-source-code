const express = require('express');
const router = require('express').Router();
const Subadmin = require('../models/Subadmin');

//GET
router.get('/', async  (req, res, next) => {
   try{
      const subadmin = await Subadmin.find();
     res.json(subadmin);
     }catch(err){
      return res.json({ message:err });
  }
   });

   ///POST
router.post('/', async  (req, res) => {
    const subadmin = new Subadmin({
         Name: req.body.Name,
         Contactnumber: req.body.Contactnumber,
         Address: req.body.Address,
         Pincode: req.body.Pincode,
         Email: req.body.Email,
         Password: req.body.Email,
        });
        try{
         const savedSubadmin = await subadmin.save()
        res.json(savedSubadmin);
        }catch(err){
            res.json({message: err});
        }
    });





    //Delete Post
router.delete('/:subadminId' , async (req,res) => {
    try{
        const removedSubadmin = await Subadmin.remove({_id: req.params.subadminId});
       res.json(removedSubadmin);
    }catch(err){
        return res.json({ message:err });
    }
});
        
 

    //update post
router.patch('/:subadminId', async (req,res) => {
    try{
        const updatedSubadmin = await Subadmin.updateOne(
        { _id: req.params.subadminId},
        {$set: { Name: req.body.Name} }
        );
        res.json(updatedSubadmin)
    }catch(err){
        return res.json({ message:err });
    }
});   
    


        
       
      
    
    module.exports = router;