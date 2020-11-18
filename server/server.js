const express       = require('express')
const bodyParser    = require('body-parser');
const sequelize     = require('./utils/mysql');
const User          = require('./models/Users');
const app = express();
app.use(bodyParser.urlencoded({ extended: true }));
app.get('/',(req,res)=>{
    console.log('requested')
    res.send('<h1>hello</h1>')
})
app.post('/register', (req, res, next) => {
    let fullName = req.body.fullName;
    let email = req.body.email;
    let contact = req.body.contact;
    let password = req.body.password
    console.log(fullName);
    console.log(email);
    User.create({
        name:fullName,
        email:email,
        contact:contact,
        password:password
    }).then(user =>{
        console.log("user created successfully");
        res.send("user created successfully")
    }).catch(err => console.log(err));
})

sequelize
.sync()
.then(result =>{
    app.listen(8000, () => {
        console.log("Server started")
    })
}).catch(err => console.log(err))
