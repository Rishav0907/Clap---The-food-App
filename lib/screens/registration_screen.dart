import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:social_media/constants/constant.dart';
import 'package:social_media/constants/input_style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum FieldType { Name, Email, Contact, Password }
const URL="http://192.168.43.203/register";
class Registration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Center(
                child: Text(
                  'REGISTER',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 40,
                      letterSpacing: 5,
                      fontFamily: 'Lato'),
                ),
              ),
            ),
            SizedBox(
              height: 48,
            ),
            InputStyle(
              inputName: 'Full Name',
              keyboardType: TextInputType.name,
              formIcon: FontAwesomeIcons.user,
              fieldType: FieldType.Name,
            ),
            SizedBox(
              height: 20,
            ),
            InputStyle(
                inputName: 'Email',
                keyboardType: TextInputType.emailAddress,
                formIcon: FontAwesomeIcons.keyboard,
                fieldType: FieldType.Email),
            SizedBox(
              height: 20,
            ),
            InputStyle(
              inputName: 'Contact no',
              keyboardType: TextInputType.number,
              formIcon: FontAwesomeIcons.phone,
              fieldType: FieldType.Contact,
            ),
            SizedBox(
              height: 20,
            ),
            InputStyle(
              inputName: 'Password',
              keyboardType: TextInputType.visiblePassword,
              textVisibility: true,
              formIcon: FontAwesomeIcons.lock,
              fieldType: FieldType.Password,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              child: RaisedButton(
                padding: EdgeInsets.all(20),
                onPressed: () async{
                  var respone = await http.post(URL,body: {
                    'fullName':name,
                    'email':email,
                    'contact':contact,
                    'password':password
                  });
                  print(respone.body);
                },
                elevation: 15,
                textColor: Colors.white,
                color: Colors.red,
                child: Center(
                  child: Row(
                  children: [
                    Text('CREATE ACCOUNT'),
                    SizedBox(
                      width: 50,
                    ),
                    Icon(FontAwesomeIcons.arrowCircleRight)
                  ],
                ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
