const { number } = require('@hapi/joi');
const mongoose = require('mongoose');


const HomeaddSchema=mongoose.Schema({



    
    productname: {
        type: String,
        required:true
    },
    description: {
        type: String,
        required:true
    },
    quantity: {
        type: String,
        required:true
    },
    unit: {
        type: String,
        required:true
    },
    rate: {
        type: String,
        required:true
    },
    hotelname: {
        type: String,
        required:true
    },
    available: {
        type: Boolean,
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
   
   
    // photo: {
    //     type: String,
    //     // required:true
    // },
    date: {
        type: Date,
        default: Date.now
    }
});

module.exports = mongoose.model('Homeadd', HomeaddSchema);