import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:pet_project_flutter/widgets/commons/layouts/basic_layout.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final String USER_NAME_KEY = 'userName';
  @override
  Widget build(BuildContext context) {
    return BasicLayout(
      child: FormBuilder(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(children: [
            FormBuilderTextField(
              name: USER_NAME_KEY,
              
            )
          ])),
    );
  }
}
