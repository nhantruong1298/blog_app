import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:pet_project_flutter/generated/l10n.dart';
import 'package:pet_project_flutter/widgets/commons/layouts/basic_layout.dart';
import 'package:pet_project_flutter/widgets/input/password_input_field.dart';
import 'package:pet_project_flutter/widgets/input/text_input_field.dart';

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
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BasicLayout(
      automaticallyImplyLeading: false,
      title: 'Sign in',
      child: FormBuilder(
          key: _formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextInputField(
                name: USER_NAME_KEY,
                initValue: '',
                label: S.current.SIGN_IN_EMAIL,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(context),
                  FormBuilderValidators.email(context)
                ]),
                autoFillHints: [AutofillHints.email]),
            PasswordInputField(
              name: PASSWORD_KEY,
              label: S.current.SIGN_IN_PASSWORD,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              initValue: '',
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(context),
                FormBuilderValidators.minLength(context, 8)
              ]),
            ),
          ])),
    );
  }
}
