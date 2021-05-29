const express = require('express');
const Orderdetailsss = require('../models/Orderdetailsss');
const router = express.Router();
// const Post = require('../models/Post');







router.get('/',(req,res)=>{ 
    orderdetailsss.find({}).then(data=>{
        res.send(data)
    }).catch(err=>{
        console.log(err)
    })
    
    
})

//submits a post
router.post("/",async(req,res)=>{
    
const orderdetailsss = new Orderdetailsss({
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

const savedOrderdetailsss = await orderdetailsss.save();
    res.json(savedOrderdetailsss);
}catch (err){
    res.json({ message: err });
}
});



//update
router.patch('/:postId', async (req, res) => {
    try {
      const updatedorderdetailsss = await Orderdetailsss.updateOne(
        {_id: req.params.postId}, 
        { $set: {statusdetails: req.body.statusdetails} }
        );
      res.json(updatedorderdetailsss);
    } catch (err) {
      res.json({message: err});
    }
  
  });
  

  //delete post
router.delete('/:postId', async(req, res) => {
    try {
   const removedorderdetailsss = await Orderdetailsss.remove({ _id: req.params.postId});
   res.json(removedorderdetailsss);
    } catch (err) {
      res.json({ message: err });
      }
});

module.exports = router;