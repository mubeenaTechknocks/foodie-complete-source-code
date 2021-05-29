const router = require('express').Router();
const Hotel = require ('../models/Hotel');
const jwt = require ('jsonwebtoken');
const bcrypt = require ('bcryptjs');
const {logschema} = require('../hotelvalidation');





//login
router.post('/login', async (req,res) => {
    const {error}  =await logschema.validateAsync(req.body)
    console.log(error)

    // const {error} = logschema(req.body);
    // if (error) return res.status(402).send(error.details[0].message);
    //check email exist
const hotel = await Hotel.findOne({email: req.body.email});
if(!hotel) return res.status(400).send('email or password doesnt exists');

//password is correct
const validPass = await bcrypt.compare(req.body.password, hotel.password);
if(!validPass) return res.status(401).send('invalid password')

//create andassign a token
const token =jwt.sign({_id: hotel._id},'${process.env.SECRET_KEY}' );
res.status(202).header('auth-token', token).send(token);


// res.send('Logged in!')


});

module.exports = router;