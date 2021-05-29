const { string } = require('@hapi/joi');
const mongoose = require('mongoose');


const OrderdetailsssSchema=mongoose.Schema({

    statusdetails: {
        type: String,
        required:true
        
    },

    orderdate: {
        type: String,
        required:true
        
    },
    payment: {
        type: String,
        required:true
    },
    housename: {
        type: String,
        required:true
    },
    street: {
        type: String,
        required:true
    },
    city: {
        type: String,
        required:true
    },
    itemName: {
        type: String,
        required:true
    },
    itemRate: {
        type: String,
        required:true
    },
    quantity: {
        type: String,
        required:true
    },
    username: {
        type: String,
        required:true
    },
    phno: {
        type: String,
        required:true
    },
    userlatitude: {
        type: String,
        required:true
    },
    userlongitude: {
        type: String,
        required:true
    },
    hotelname: {
        type: String,
        required:true
    },
    hoteladdressplace: {
        type: String,
        required:true
    },
    hoteladdresscity: {
        type: String,
        required:true
    },
    hotelphonenumber: {
        type: Number,
        required:true
    },
    hotellatitude: {
        type: String,
        required:true
    },
    hotellongitude: {
        type: String,
        required:true
    },
    
    date: {
        type: Date,
        default: Date.now
    }
});

module.exports = mongoose.model('Orderdetailsss', OrderdetailsssSchema);