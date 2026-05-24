const mongoose = require('mongoose');

const connectMongo = async () => {
    try {
        await mongoose.connect('mongodb://127.0.0.1:27017/hospital_mongo');
        console.log('MongoDB conectado');
    } catch (error) {
        console.error('Error Mongo:', error);
    }
};

module.exports = connectMongo;