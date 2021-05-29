const mongoose = require('mongoose');


const PostfSchema=mongoose.Schema({

    offer_percent:{
        type: String,
        required:true
    },
        offer_name:{
            type: String,
            required:true
        },
    
    date: {
        type: Date,
        default: Date.now
    }
});

module.exports = mongoose.model('Postf', PostfSchema);