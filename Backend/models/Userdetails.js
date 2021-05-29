const mongoose = require('mongoose');


const userdetailsSchema = new mongoose.Schema({
    name: {
        type: String,
        required: true,
        min: 6
        
    },
    email: {
        type: String,
        required: true,
        max: 255,
        min: 6
        
    },
    phone:{
        type: String,
        required: true,
        max: 1024,
        min: 6
    },
    date: {
        type: Date,
        default: Date.now
    }

});
mongoose.models = {}
module.exports = mongoose.model('Userdetails', userdetailsSchema);