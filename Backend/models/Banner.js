const mongoose = require('mongoose');


const BannerSchema=mongoose.Schema({



    
    title: {
        type: String,
        required:true
    },
    description: {
        type: String,
        required:true
    },
   
    banner: {
        type: String,
        required:true
    },
    date: {
        type: Date,
        default: Date.now
    }
});

module.exports = mongoose.model('Banners', BannerSchema);