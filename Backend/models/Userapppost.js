const mongoose = require('mongoose');


const UserapppostSchema = mongoose.Schema({
    Item:{
        type: String,
        required: true
    },
    Price: {
        type: Number,
        required: true   
    },
    Quantity: {
        type: Number,
        required: true    
    },
    Payment: {
        type: String,
        required: true    
    },
    Name: {
        type: String,
        required: true    
    },
    Contactnumber:{
        type: Number,
        required: true
    },
    Addressline1: {
        type: String,
        required: true    
    },
    Addressline2: {
        type: String,
        required: true    
    },
    Pincode: {
        type: Number,
        required: true
    },
    City: {
        type: String,
        required: true    
    },
    State: {
        type: String,
        required: true    
    },
    Orderprice: {
        type: Number,
        required: true
    },
    Deliverycharges: {
        type: Number,
        required: true
    },
    Tax: {
        type: Number,
        required: true
    },
    Total: {
        type: Number,
        required: true
    }
    




})

module.exports = mongoose.model('userapppost', UserapppostSchema);