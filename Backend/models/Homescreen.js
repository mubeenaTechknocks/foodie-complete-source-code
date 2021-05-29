const mongoose = require('mongoose');


const HomescreenSchema = mongoose.Schema({
    hotelsname: {
        type: String,
        required: true
        
    },
    item: {
        type: String,
        required: true
        
    },
    price: {
        type: String,
        required: true
        
    },
    openingtime:{
        type: String,
        required: true
    },
    closingtime: {
        type: String,
        required: true
    },
    status: {
        type: String,
        required: true
        
    },
    

})

module.exports = mongoose.model('homescreen', HomescreenSchema)