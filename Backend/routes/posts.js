const express = require('express');
const router = express.Router();
const Post = require('../models/Post');



//submits a post
router.post("/",async(req,res)=>{
    
const posts = new Post({
    title: req.body.title,
    
});
try{

const savedPost = await posts.save();
    res.json(savedPost);
}catch (err){
    res.json({ message: err });
}
});

//update
router.patch('/:postId', async (req, res) => {
    try {
      const updatedPost = await Post.updateOne(
        {_id: req.params.postId}, 
        { $set: {title: req.body.title} }
        );
      res.json(updatedPost);
    } catch (err) {
      res.json({message: err});
    }
  
  });

  //delete post
router.delete('/:postId', async(req, res) => {
    try {
   const removedPost = await Post.remove({ _id: req.params.postId});
   res.json(removedPost);
    } catch (err) {
      res.json({ message: err });
      }
});



module.exports = router;