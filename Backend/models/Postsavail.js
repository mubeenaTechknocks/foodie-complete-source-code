const mongoose = require('mongoose');


const PostsavailSchema=mongoose.Schema({

    available_food_name: {
        type: String,
        required:true
    },
    available_food_count:  {
        type: String,
        required:true
    },
    
    date: {
        type: Date,
        default: Date.now
    }
});

module.exports = mongoose.model('Postsavail', PostsavailSchema);