const mongoose = require('mongoose');


const PostftSchema=mongoose.Schema({

    food_type: {
        type: String,
        required:true
    },
    
    date: {
        type: Date,
        default: Date.now
    }
});

module.exports = mongoose.model('Postft', PostftSchema);