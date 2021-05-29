const mongoose = require('mongoose');


const DeliveryboySchema = mongoose.Schema({
  

    email: {
        type: String,
        required: true,
        max: 255,
        min: 6
        
    },
    password:{
        type: String,
        required: true,
        max: 1024,
        min: 6
    },
    
    name:{
            required:true,
            type:String
        },
        
        age:{
            required:true,
            type:String
        },
        phone:{
            required:true,
            type:String
        },
        bloodGroup:{
            required:true,
            type:String
        },
        

            houseName:{
                required:true,
                type:String
            },
            postOffice:{
                required:true,
                type:String
            },
            city:{
                required:true,
                type:String
            },
            pincode:{
                required:true,
                type:String
            },
        
    
   
       
        licenceNo:{
            required:true,
            type:String
        },
        vehicleModel:{
            required:true,
            type:String
        },
        vehicleColor:{
            required:true,
            type:String
        },
        regNo:{
            required:true,
            type:String
        },
    
    date: {
        type: Date,
        default: Date.now
    }

});

module.exports = mongoose.model('Deliveryboy', DeliveryboySchema);