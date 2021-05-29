const { required } = require('@hapi/joi');
const Joi = require('@hapi/joi');

const registerValidation = data =>{
const schema = {
   
   
    Hotelsname: Joi.string().required(),
    Hotelslocation: Joi.string().required(),
    Hotelsaddress: Joi.string().required(),
    Pincode: Joi.number().required(),
    Ownersname: Joi.string().required(),
    Ownersaddress: Joi.string().required(),
    Contactnumber: Joi.number().required(),
    Email: Joi.string()
    .min(6)
    .required()
    .email(),
    Password: Joi.string()
    .min(6)
    .required(),
};
return Joi.validate(data, schema );
};

const loginValidation = data =>{
    const schema = {
        Email: Joi.string()
        .min(6)
        .required()
        .email(),
        Password: Joi.string()
        .min(6)
        .required()
    };
      return Joi.validate(data, schema );
    };

module.exports.registerValidation = registerValidation;
module.exports.loginValidation = loginValidation;