const mongoose = require('mongoose');


const HoteldetailsSchema = mongoose.Schema({
    Hotelsname: {
        type: String,
        required: true
        
    },
    Hotelslocation: {
        type: String,
        required: true
        
    },
    Hotelsaddress: {
        type: String,
        required: true
        
    },
    Pincode:{
        type: Number,
        required: true
    },
    Ownersname: {
        type: String,
        required: true
    },
    Ownersaddress: {
        type: String,
        required: true
        
    },
    Contactnumber: {
        type: Number,
        required: true
        
    },
    Email:{
        type: String,
        required: true
    },
    Password: {
        type: String,
        required: true
    },
    


})

module.exports = mongoose.model('hoteldetails', HoteldetailsSchema)