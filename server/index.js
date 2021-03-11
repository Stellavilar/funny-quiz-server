require('dotenv').config({ path: '/Users/Stelou/PROJETS JS/REACT/Funny-quiz-server/.env'});
const express = require ('express');
const session = require ('express-session');
const bodyParser = require('body-parser');
const router = require ('./routes/router');
const cors = require ('cors');
const app = express();


const corsMiddleware = require ('./middlewares/corsMiddleware');
app.use(corsMiddleware);
app.use(express.json());


app.use(session({
    secret: process.env.SECRET_SESSION,
    resave: true, 
    saveUninitialized: true, 
    cookie: { 
    secure: false,
    sameSite: 'strict',
    maxAge: (1000*60*60*24*30*12)
  }
}));

app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());

app.use(router);
app.use((req,res) => {
    return res.send({ "404 ": "Not Found" });
});


const PORT = process.env.PORT || 1234;


app.listen(PORT, () => {
    console.log(`Listening on port ${PORT}`);
});

