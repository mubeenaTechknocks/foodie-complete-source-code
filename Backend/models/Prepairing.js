const mongoose = require('mongoose');


const PrepairingSchema=mongoose.Schema({



    orderdate: {
        type: Date,
        
        
    },
    prepairing: {
        type: String,
        required:true
    },


    payment: {
        type: String,
        required:true
    },
    address: {
        type: String,
        required:true
    },
    item: {
        type: String,
        required:true
    },
    name: {
        type: String,
        required:true
    },
    phno: {
        type: String,
        required:true
    },
    
    date: {
        type: Date,
        default: Date.now
    }
});

module.exports = mongoose.model('Prepairing', PrepairingSchema);