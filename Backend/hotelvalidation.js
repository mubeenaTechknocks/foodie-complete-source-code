//Validation

const Joi = require('@hapi/joi');


const logschema = Joi.object ({
   
    email: Joi.string()
    .min(6)
    .required()
    .email(),
    password: Joi.string()
    .min(6)
    .required()
});



module.exports = {
   logschema
}