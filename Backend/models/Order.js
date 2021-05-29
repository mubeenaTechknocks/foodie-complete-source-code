const mongoose = require('mongoose');


const OrderSchema = mongoose.Schema({
    Orderdate: {
        type: String,
        required: true
        
    },
    Hotelsname: {
        type: String,
        required: true
        
    },
    Orderamount:{
        type: String,
        required: true
    },
    Payment: {
        type: String,
        required: true
        
    },
    Address: {
        type: String,
        required: true
        
    },
    Item:{
        type: String,
        required: true
    },
    Price: {
        type: Number,
        required: true
        
    },
    Quantity: {
        type: String, Number,
        required: true
        
    },
    Name: {
        type: String,
        required: true
        
    },
    Phonenumber:{
        type: Number,
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

module.exports = mongoose.model('orders', OrderSchema);