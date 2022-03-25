import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:pet_project_flutter/widgets/commons/layouts/basic_layout.dart';
import 'package:pet_project_flutter/widgets/input/password_input_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final String USER_NAME_KEY = 'userName';
  final String PASSWORD_KEY = 'password';
  @override
  Widget build(BuildContext context) {
    return BasicLayout(
      child: FormBuilder(
          key: _formKey,
          child: Column(children: [
            PasswordInputField(
              name: PASSWORD_KEY,
            validator: FormBuilderValidators.compose([

            ]),),
          ])),
    );
  }
}
