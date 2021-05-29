const { required } = require('@hapi/joi');
const Joi = require('@hapi/joi');

const registerValidation = data =>{
const schema = {
   
    email: Joi.string()
    .min(6)
    .required()
    .email(),
    password: Joi.string()
    .min(6)
    .required(),
    name: Joi.string().required(),
    age: Joi.string().required(),
    phone: Joi.string().required(),
    bloodGroup: Joi.string().required(),
    houseName: Joi.string().required(),
    postOffice: Joi.string().required(),
    city: Joi.string().required(),
    pincode: Joi.string().required(),
    licenceNo: Joi.string().required(),
    vehicleModel: Joi.string().required(),
    vehicleColor: Joi.string().required(),
    regNo: Joi.string().required(),
};
return Joi.validate(data, schema );
};

const loginValidation = data =>{
    const schema = {
        email: Joi.string()
        .min(6)
        .required()
        .email(),
        password: Joi.string()
        .min(6)
        .required()
    };
      return Joi.validate(data, schema );
    };

module.exports.registerValidation = registerValidation;
module.exports.loginValidation = loginValidation;