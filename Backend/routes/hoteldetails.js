const { Router } = require('express');
const router = require('express').Router();
const Hoteldetails = require('../models/Hoteldetails');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
const {registerValidation,loginValidation} = require('../routes/hotelvalidation');

router.get('/getallhotels', async  (req, res, next) => {
    try{
       const hoteldetails = await Hoteldetails.find();
      res.json(hoteldetails);
      }catch(err){
       return res.json({ message:err });
   }
    });

    router.post('/getonehotel', async  (req, res, next) => {
        try{
           
            const hoteldetails = await Hoteldetails.findOne({Email:req.body.Email});
           if(!hoteldetails){
            return res.status(400).send('Email is not found');
           } else{
               res.send({
                                     
                Hotelsname: req.body.Hotelsname,
                Hotelslocation: req.body.Hotelslocation,
                Hotelsaddress: req.body.Hotelsaddress,
                Pincode: req.body.Pincode,
                Ownersname: req.body.Ownersname,
                Ownersaddress: req.body.Ownersaddress,
                Contactnumber: req.body.Contactnumber,
                Email: req.body.Email,
                Password: hashedPassword,
               })
           }

          }catch(err){
           return res.json({ message:err });
       }
        });
 

router.post('/register',async (req, res) => {
    const {error} = registerValidation(req.body);
   if (error) return res.status(400).send(error.details[0].message);
   //checkng  user
   const emailExist = await Hoteldetails.findOne({Email:req.body.Email});
   if(emailExist) return res.status(400).send('Email already exist');
   //hash passwrd
   const salt = await bcrypt.genSalt(10);
   const hashedPassword = await bcrypt.hash(req.body.Password, salt);


   const hoteldetails = new Hoteldetails({
       
    Hotelsname: req.body.Hotelsname,
    Hotelslocation: req.body.Hotelslocation,
    Hotelsaddress: req.body.Hotelsaddress,
    Pincode: req.body.Pincode,
    Ownersname: req.body.Ownersname,
    Ownersaddress: req.body.Ownersaddress,
    Contactnumber: req.body.Contactnumber,
    Email: req.body.Email,
    Password: hashedPassword,
        
        
    });
    try{
         const savedHoteldetails = await hoteldetails.save();
         res.send({hoteldetails: hoteldetails._id});
    } catch (err) {
        res.status(400).send(err);
    }
});

router.post('/signin',async (req,res) =>{
    //validate
    const {error} = loginValidation(req.body);
    if (error) return res.status(402).send(error.details[0].message);
    const hoteldetails = await Hoteldetails.findOne({Email:req.body.Email});
   if(!hoteldetails) return res.status(400).send('Email is not found');
   //passwrd is crct
   const validPass = await bcrypt.compare(req.body.Password, hoteldetails.Password);
   if(!validPass) return res.status(401).send('Invalid password')
    //crt n assgn tkn
           const token = jwt.sign({_id: hoteldetails._id}, '${process.env.SECRET_KEY}' );
          res. header('auth-token', token).send(token);
  //res.send('Logged in!');
});




    
   
               
        //Delete Post
router.delete('/:postId' , async (req,res) => {
    try{
        const removedHoteldetails = await Hoteldetails.remove({_id: req.params.postId});
       res.json(removedHoteldetails);
    }catch(err){
        return res.json({ message:err });
    }
});



//update post
router.patch('/:postId', async (req,res) => {
    try{
        const updatedHoteldetails = await Hoteldetails.updateOne(
        { _id: req.params.postId},
        {$set: { Hotelsname: req.body.Hotelsname} }
        );
        res.json(updatedHoteldetails)
    }catch(err){
        return res.json({ message:err });
    }
});   
    module.exports = router;