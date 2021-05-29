// router.post('', async (req, res) => {

//     //lets validate the data before we a user
//     // const error  = await regschema.validateAsync(req.body);
//     // console.log(error);
// //  const {error} = regschema(req.body);
// //     if (error) return res.status(400).send(error.details[0].message);

// //check email exist
// const emailExist = await Hotel.findOne({email: req.body.email});
// if(emailExist) return res.send('email already exists');


// //hash password
// const salt = await bcrypt.genSalt(10);
// const hashedPassword = await bcrypt.hash(req.body.password, salt);


// //create a new user
//     const hotel = new Hotel({
      
//        email: req.body.email,
//        password: hashedPassword
        
//     })
//     try{
//             const savedHotel = await hotel.save();
//                 res.send({hotel: hotel._id});
//            }catch(err){
//              res.status(400).send(err);
//         }
// });