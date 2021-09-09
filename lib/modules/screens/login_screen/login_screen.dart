import 'package:flutter/material.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/styles/colors/colors.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var email_controller = TextEditingController();
    var password_controller = TextEditingController();

    var form_key = GlobalKey<FormState>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Login',
              style:Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black) ,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('login now to browse out hot offers',
                style:Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.grey) ,),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: DefaultTextForm(
                  controller: email_controller,
                  labelText: 'Email',
                  keyboardType:TextInputType.emailAddress,
                  prefixIcon: Icons.email_outlined,
                  validate: (value){},
                  ),
            ),

            DefaultTextForm(
                controller: password_controller,
                labelText: 'Password',
                prefixIcon: Icons.lock_open_outlined,
                suffixIcon: Icons.remove_red_eye,
                validate: (value){}),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: defaultButton(
                  function: () {  },
                  text: 'Login', background: primary_color),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account?'),
                TextButton(onPressed: (){}, child: Text('REGISTER'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
