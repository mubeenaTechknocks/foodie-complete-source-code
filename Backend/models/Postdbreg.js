const mongoose = require('mongoose');


const PostdbregSchema=mongoose.Schema({
    
    deliveryboy_name:  {
        type: String,
        required:true
    },
    deliveryboy_address:  {
        type: String,
        required:true
    },
    deliveryboy_age:  {
        type: String,
        required:true
    },
    
    deliveryboy_vehicle_type:  {
        type: String,
        required:true
    },
    deliveryboy_vehicle_name:  {
        type: String,
        required:true
    },
    deliveryboy_vehicle_color:  {
        type: String,
        required:true
    },
    deliveryboy_plate_no:  {
        type: String,
        required:true
    },
    deliveryboy_license_no:  {
        type: String,
        required:true
    },
    
    date: {
        type: Date,
        default: Date.now
    }
});

module.exports = mongoose.model('Postdbreg', PostdbregSchema);