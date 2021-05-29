const { Router } = require('express');
const router = require('express').Router();
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
const {registerValidation,loginValidation} = require('../routes/uservalidation');
const Userreg = require('../models/Userreg');
router.get('/', async  (req, res, next) => {
    try{
       const userreg = await Userreg.find();
      res.json(userreg);
      }catch(err){
       return res.json({ message:err });
   }
    });
 

router.post('/register',async (req, res) => {
    const {error} = registerValidation(req.body);
   if (error) return res.status(400).send(error.details[0].message);
   //checkng  user
   const emailExist = await Userreg.findOne({email:req.body.email});
   if(emailExist) return res.status(400).send('Email already exist');
   //hash passwrd
   const salt = await bcrypt.genSalt(10);
   const hashedPassword = await bcrypt.hash(req.body.password, salt);

   const userreg = new Userreg({
        name:req.body. name,
        email: req.body.email,
        phone:req.body. phone,
        password: hashedPassword,
        
        
        
    });
    try{
         const savedUserappreg = await userreg.save();
         res.send({userreg: userreg._id});
    } catch (err) {
        res.status(400).send(err);
    }
});

router.post('/signin',async (req,res) =>{
    //validate
    const {error} = loginValidation(req.body);
    if (error) return res.status(402).send(error.details[0].message);
    const userreg = await Userreg.findOne({email:req.body.email});
   if(!userreg) return res.status(400).send('Email is not found');
   //passwrd is crct
   const validPass = await bcrypt.compare(req.body.password, userreg.password);
   if(!validPass) return res.status(401).send('Invalid password')
    //crt n assgn tkn
           const token = jwt.sign({_id: userreg._id}, '${process.env.SECRET_KEY}' );
          res. header('auth-token', token).send(token);
  //res.send('Logged in!');
});




module.exports = router;