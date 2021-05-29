const mongoose = require('mongoose');


const PriceSchema=mongoose.Schema({



    
    price: {
        type: String,
        required:true
    },
    
    date: {
        type: Date,
        default: Date.now
    }
});

module.exports = mongoose.model('Price', PriceSchema);