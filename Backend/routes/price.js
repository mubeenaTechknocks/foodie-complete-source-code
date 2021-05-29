const express = require('express');
const router = express.Router();
const Price = require('../models/Price');



//submits a post
router.post("/",async(req,res)=>{
    
const price = new Price({
    price: req.body.price,
    
});
try{

const savedPrice = await price.save();
    res.json(savedPrice);
}catch (err){
    res.json({ message: err });
}
});

//update
router.patch('/:priceId', async (req, res) => {
    try {
      const updatedPrice = await Price.updateOne(
        {_id: req.params.priceId}, 
        { $set: {price: req.body.price} }
        );
      res.json(updatedPrice);
    } catch (err) {
      res.json({message: err});
    }
  
  });

  //delete post
router.delete('/:priceId', async(req, res) => {
    try {
   const removedPrice = await Price.remove({ _id: req.params.priceId});
   res.json(removedPrice);
    } catch (err) {
      res.json({ message: err });
      }
});



module.exports = router;