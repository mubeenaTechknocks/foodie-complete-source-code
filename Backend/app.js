const express = require('express');

const app = express();
const mongoose = require('mongoose');
const bodyparser = require ('body-parser');
const cors = require('cors');
require('dotenv/config');

app.use('/uploads', express.static('uploads'));
app.use(cors());
app.use(bodyparser.json());

//import routes





//import routes sr
const postsRoute = require('./routes/posts');
const priceRoute = require('./routes/price');
const bannerRoute = require('./routes/banner');
const homeaddRoute = require('./routes/homeadd');
const orderdetailsRoute = require('./routes/orderdetails');
const prepairingRoute = require('./routes/prepairing');
const postsavailRoute = require('./routes/postsavail');
const postsdbRoute = require('./routes/postsdb');
const postsftRoute = require('./routes/postsft')
const postsfRoute = require('./routes/postsf');
const postsOfRoute = require('./routes/postsof');
const getpostsRoute = require('./routes/getpost');
const postdbregRoute = require('./routes/postdbreg');
const hoteldetailsRoute = require('./routes/hoteldetails');
const orderRoute = require('./routes/orders');
const restaurantsRoute = require('./routes/restaurants');
const authRoute = require('./routes/auth');
const subadminRoute = require('./routes/subadmin');
const deliveryordersRoute = require('./routes/deliveryorders');
const deliveryappregRoute = require('./routes/deliveryappreg');
const userdetailsRoute = require('./routes/userdetails');
const orderdetailsssRoute = require('./routes/orderdetailsss');
const deliveryboyRoute = require('./routes/deliveryboy');
const userregRoute = require('./routes/userreg');
const homescreenRoute = require('./routes/homescreen');
const userapppostRoute = require('./routes/userapppost');
app.use('/hotel/postsavail', postsavailRoute);
app.use('/hotel/postsdb', postsdbRoute);
app.use('/hotel/postsft', postsftRoute);
app.use('/hotel/postsf', postsfRoute);
app.use('/hotel/postsof', postsOfRoute);
app.use('/hotel/getposts', getpostsRoute);
app.use('/hotel/postdbreg', postdbregRoute);
app.use('/admin/hoteldetails', hoteldetailsRoute)
app.use('/admin/orders', orderRoute);
app.use('/admin/restaurants', restaurantsRoute);
app.use('/admin/api/user', authRoute);
app.use('/admin/subadmin',subadminRoute);
app.use('/admin/deliveryorders', deliveryordersRoute);
app.use('/delivery/api/user',deliveryappregRoute);
app.use('/user/userdetails',userdetailsRoute);
app.use('/hotel/posts', postsRoute);
app.use('/hotel/price', priceRoute);
app.use('/hotel/banner', bannerRoute);
app.use('/hotel/homeadd', homeaddRoute);
app.use('/hotel/orderdetails', orderdetailsRoute);
app.use('/hotel/prepairing', prepairingRoute);
app.use('/hotel/orderdetailsss', orderdetailsssRoute);
app.use('/admin/deliveryboy',deliveryboyRoute);
app.use('/user/api/user',userregRoute);
app.use('/user/homescreen',homescreenRoute);
app.use('user/userapppost', userapppostRoute);
//ROUTES
app.get('/',(req, res) => {
    res.send('we are on home')
});


const hotelloginRoute = require('./routes/hotellogin');
app.use('/hotel/hotel', hotelloginRoute);

mongoose.connect(process.env.DB_CONNECTION,
    { useUnifiedTopology: true, useNewUrlParser: true },


() => console.log('connect to db!')
);

// app.listen(3000); 
const port = process.env.PORT || 5000;
app.listen(port, () => {
    console.log("listening to 5000 ");
});