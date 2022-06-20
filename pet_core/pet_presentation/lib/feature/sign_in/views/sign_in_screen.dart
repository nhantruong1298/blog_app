import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:pet_presentation/feature/sign_in/cubit/sign_in_cubit.dart';
import 'package:pet_presentation/generated/l10n.dart';
import 'package:pet_presentation/widgets/commons/button/button.dart';
import 'package:pet_presentation/widgets/commons/layouts/basic_layout.dart';
import 'package:pet_presentation/widgets/input/password_input_field.dart';
import 'package:pet_presentation/widgets/input/text_input_field.dart';
import 'package:pet_presentation/widgets/spacing.dart';

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
      child: _loginForm(),
    );
  }

  SignInCubit get signInCubit => BlocProvider.of<SignInCubit>(context);

  Widget _loginForm() {
    return FormBuilder(
        key: _formKey,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextInputField(
              name: USER_NAME_KEY,
              initValue: '',
              label: S.current.SIGN_IN__EMAIL,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(context),
                FormBuilderValidators.email(context)
              ]),
              autoFillHints: const [AutofillHints.email]),
          const Spacing(1),
          PasswordInputField(
            name: PASSWORD_KEY,
            label: S.current.SIGN_IN__PASSWORD,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            initValue: '',
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(context),
              FormBuilderValidators.minLength(context, 8)
            ]),
          ),
          const Spacing(1),
          AppButton(onPressed: () {}, text: S.current.SIGN_IN__TEXT)
        ]));
  }
}
