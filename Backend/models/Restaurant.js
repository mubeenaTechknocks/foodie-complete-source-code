const mongoose = require('mongoose');


const RestaurantSchema = mongoose.Schema({
    restaurantname: {
        type: String,
        required: true
    },
    deliveredorders: {
        type: String,
        required: true
    },
    pendingorders: {
        type: String,
        required: true
    }
    
    
});

module.exports = mongoose.model('Restaurants', RestaurantSchema);