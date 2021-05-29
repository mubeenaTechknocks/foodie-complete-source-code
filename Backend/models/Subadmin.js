const mongoose = require('mongoose');


const SubadminSchema = mongoose.Schema({
    Name: {
        type: String,
        required: true
        
    },
    Contactnumber: {
        type: String,
        required: true
        
    },
    Address: {
        type: String,
        required: true
        
    },
    Pincode:{
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

module.exports = mongoose.model('subadmin', SubadminSchema);