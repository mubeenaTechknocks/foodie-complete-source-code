const express = require('express');
const router = express.Router();
const Homeadd = require('../models/Homeadd');

router.get('/',(req,res)=>{ 
    Homeadd.find({}).then(data=>{
        res.send(data)
    }).catch(err=>{
        console.log(err)
    })
    
    
})

//submits a post
router.post("/",async(req,res)=>{
    
const homeadd = new Homeadd({
    productname: req.body.productname,
    description: req.body.description,
    quantity: req.body.quantity,
    unit:req.body.unit,
    rate: req.body.rate,
    hotelname: req.body.hotelname,
    available: req.body.available,
    hoteladdressplace: req.body.hoteladdressplace,
    hotelphonenumber: req.body.hotelphonenumber,
    hoteladdresscity: req.body.hoteladdresscity,
    hotellatitude: req.body.hotellatitude,
    hotellongitude: req.body.hotellongitude,
});
try{
    
    const savedHomeaddd = await homeadd.save();
        res.json(savedHomeaddd);
    }catch (err){
        res.json({ message: err });
    }
    });

//update
router.patch('/:postId', async (req, res) => {
    try {
      const updatedHomeadd = await Homeadd.updateOne(
        {_id: req.params.postId}, 
        { $set: {
          productname: req.body.productname,
          description: req.body.description,
          quantity: req.body.quantity,
          unit:req.body.unit,
          rate: req.body.rate,
          hotelname: req.body.hotelname,
          available: req.body.available,
          hoteladdressplace: req.body.hoteladdressplace,
          hotelphonenumber: req.body.hotelphonenumber,
          hoteladdresscity: req.body.hoteladdresscity,
          hotellatitude: req.body.hotellatitude,
          hotellongitude: req.body.hotellongitude,
      } }
        );
      res.json(updatedHomeadd);
    } catch (err) {
      res.json({message: err});
    }
  
  });

  //delete post
router.delete('/:postId', async(req, res) => {
    try {
   const removedHomeadd = await Homeadd.remove({ _id: req.params.postId});
   res.json(removedHomeadd);
    } catch (err) {
      res.json({ message: err });
      }
});

module.exports = router;




// const express = require('express');
// const Homeadd = require('../models/Homeadd');
// const router = express.Router();
// // const Post = require('../models/Post');
// // const multer = require('multer');
// const multer = require('multer');



// const storage = multer.diskStorage({
//   destination: function(req, file, cb){
//     cb(null, './upload/');
//   },  
//     filename: function(req,file,cb){
//      cb(null,file.originalname);
//     }
// });

// const upload = multer({storage: storage});










// //upload an image
// router.post("/",upload.single('homeadd'),async(req,res)=>{
//     console.log(req.file)
//     const homeadd = new Homeadd({
//         title : req.body.title,
//         photo : req.file.path
//     });
//     res.send(req.file);
//     try{
    
//     const savedHomeaddd = await homeadd.save();
//         res.json(savedHomeaddd);
//     }catch (err){
//         res.json({ message: err });
//     }
//     });


// module.exports = router;