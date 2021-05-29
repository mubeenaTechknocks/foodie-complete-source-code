const { Router } = require('express');
const router = require('express').Router();
const User = require('../models/Deliveryappreg');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
const {registerValidation,loginValidation} = require('../routes/deliveryvalidation');
const Deliveryappreg = require('../models/Deliveryappreg');
router.get('/getalldeliveryboys', async  (req, res, next) => {
    try{
       const deliveryappreg = await Deliveryappreg.find();
      res.json(deliveryappreg);
      }catch(err){
       return res.json({ message:err });
   }
    });

    router.post('/getonedeliveryboy', async  (req, res, next) => {
        try{
           
            const deliveryappreg = await Deliveryappreg.findOne({email:req.body.email});
           if(!deliveryappreg){
            return res.status(400).send('Email is not found');
           } else{
               res.send({
                   email: deliveryappreg.email,
                   personalInformations:{
                       name:deliveryappreg.name,
                       age:deliveryappreg.age,
                       phone:deliveryappreg.phone,
                       bloodGroup:deliveryappreg.bloodGroup,
                       address:{
                           houseName:deliveryappreg.houseName,
                           postOffice:deliveryappreg.postOffice,
                           city:deliveryappreg.city,
                           pincode:deliveryappreg.pincode
                       }
                   },
                   vehicleDetails:{
                       licenceNo:deliveryappreg.licenceNo,
                       vehicleModel:deliveryappreg.vehicleModel,
                       vehicleColor:deliveryappreg.vehicleColor,
                       regNo:deliveryappreg.regNo,
                   }
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
   const emailExist = await Deliveryappreg.findOne({email:req.body.email});
   if(emailExist) return res.status(400).send('Email already exist');
   //hash passwrd
   const salt = await bcrypt.genSalt(10);
   const hashedPassword = await bcrypt.hash(req.body.password, salt);


   const deliveryappreg = new Deliveryappreg({
       
        email: req.body.email,
        password: hashedPassword,
        name:req.body. name,
        age:req.body. age,
        phone:req.body. phone,
        bloodGroup:req.body. bloodGroup,
        houseName: req.body .houseName,
        postOffice: req.body .postOffice,
        city: req.body .city,
        pincode: req.body .pincode,
        licenceNo: req.body .licenceNo,
        vehicleModel: req.body .vehicleModel,
        vehicleColor: req.body .vehicleColor,
        regNo: req.body .regNo,
        
        
    });
    try{
         const savedDeliveryappreg = await deliveryappreg.save();
         res.send({deliveryappreg: deliveryappreg._id});
    } catch (err) {
        res.status(400).send(err);
    }
});

router.post('/signin',async (req,res) =>{
    //validate
    const {error} = loginValidation(req.body);
    if (error) return res.status(402).send(error.details[0].message);
    const deliveryappreg = await Deliveryappreg.findOne({email:req.body.email});
   if(!deliveryappreg) return res.status(400).send('Email is not found');
   //passwrd is crct
   const validPass = await bcrypt.compare(req.body.password, deliveryappreg.password);
   if(!validPass) return res.status(401).send('Invalid password')
    //crt n assgn tkn
           const token = jwt.sign({_id: deliveryappreg._id}, '${process.env.SECRET_KEY}' );
          res. header('auth-token', token).send(token);
  //res.send('Logged in!');
});




module.exports = router;