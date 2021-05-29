const express = require('express');
const Orderdetails = require('../models/Orderdetails');
const router = express.Router();
// const Post = require('../models/Post');







router.get('/',(req,res)=>{ 
    Orderdetails.find({}).then(data=>{
        res.send(data)
    }).catch(err=>{
        console.log(err)
    })
    
    
})

//submits a post
router.post("/",async(req,res)=>{
    
const orderdetails = new Orderdetails({
    statusdetails: req.body.statusdetails,
    orderdate: req.body.orderdate,
    payment: req.body.payment,
    housename: req.body.housename,
    street: req.body.street,
    city: req.body.city,
    itemName: req.body.itemName,
    itemRate: req.body.itemRate,
    quantity: req.body.quantity,
    username: req.body.username,
    phno: req.body.phno,
    userlatitude: req.body.userlatitude,
    userlongitude: req.body.userlongitude,
    hotelname: req.body.hotelname,
    hoteladdressplace: req.body.hoteladdressplace,
    hotelphonenumber: req.body.hotelphonenumber,
    hoteladdresscity: req.body.hoteladdresscity,
    hotellatitude: req.body.hotellatitude,
    hotellongitude: req.body.hotellongitude,
});
try{

const savedOrderdetails = await orderdetails.save();
    res.json(savedOrderdetails);
}catch (err){
    res.json({ message: err });
}
});



//update
router.patch('/:orderdetailsId', async (req, res) => {
    try {
      const updatedorderdetails = await Orderdetails.updateOne(
        {_id: req.params.orderdetailsId}, 
        { $set: {statusdetails: req.body.statusdetails} }
        );
      res.json(updatedorderdetails);
    } catch (err) {
      res.json({message: err});
    }
  
  });
  

  //delete post
router.delete('/:postId', async(req, res) => {
    try {
   const removedorderdetails = await Orderdetails.remove({ _id: req.params.postId});
   res.json(removedorderdetails);
    } catch (err) {
      res.json({ message: err });
      }
});

module.exports = router;
