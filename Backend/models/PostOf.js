const mongoose = require('mongoose');


const PostOfSchema=mongoose.Schema({

    order_recieved: {
        type: String,
        required:true
    },
    
    date: {
        type: Date,
        default: Date.now
    }
});

module.exports = mongoose.model('PostOf', PostOfSchema);