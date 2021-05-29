const mongoose = require('mongoose');


const PostdbSchema=mongoose.Schema({
    
    deliveryboy_name:  {
        type: String,
        required:true
    },
    deliveryboy_address:  {
        type: String,
        required:true
    },
    deliveryboy_total_order:  {
        type: String,
        required:true
    },
    deliveryboy_order_no:  {
        type: String,
        required:true
    },
    
    date: {
        type: Date,
        default: Date.now
    }
});

module.exports = mongoose.model('Postdb', PostdbSchema);