import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:pet_presentation/app/routes.dart';
import 'package:pet_presentation/base/base_screen.dart';
import 'package:pet_presentation/feature/dashboard/all.dart';
import 'package:pet_presentation/feature/sign_in/cubit/sign_in_cubit.dart';
import 'package:pet_presentation/generated/l10n.dart';
import 'package:pet_presentation/resources/app_colors.dart';
import 'package:pet_presentation/resources/app_dimensions.dart';
import 'package:pet_presentation/widgets/commons/button/button.dart';
import 'package:pet_presentation/widgets/commons/button/button_type.dart';
import 'package:pet_presentation/widgets/commons/layouts/basic_layout.dart';
import 'package:pet_presentation/widgets/commons/layouts/keyboard_avoid_scroll_view.dart';
import 'package:pet_presentation/widgets/commons/typography/heading_text.dart';
import 'package:pet_presentation/widgets/input/password_field.dart';
import 'package:pet_presentation/widgets/input/text_input_field.dart';
import 'package:pet_presentation/widgets/spacing.dart';
part 'sign_in_listener.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends BaseScreenState<SignInScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final String USER_NAME_KEY = 'userName';
  final String PASSWORD_KEY = 'password';

  @override
  void dispose() {
    super.dispose();
  }

  @override
  bool get willPop => false;

  @override
  Widget builder(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listener: listener,
      child: BasicLayout(
        automaticallyImplyLeading: false,
        headerVisible: false,
        centerTitle: true,
        child: _buildContent(),
      ),
    );
  }

  SignInCubit get signInCubit => BlocProvider.of<SignInCubit>(context);

  Widget _buildContent() {
    return FormBuilder(
        key: _formKey,
        child: KeyboardAvoidScrollView(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacing(3),
              Heading3Text(S.current.SIGN_IN__TEXT,
                  color: AppColors.primaryColor500),
              const Spacing(2),
              _buildUserNameField(),
              const Spacing(1),
              _buildPasswordField(),
              const Spacing(2),
              _buildLoginButton()
            ]));
  }

  Widget _buildPasswordField() {
    return PasswordInputField(
      name: PASSWORD_KEY,
      initialValue: '12345678',
      labelText: S.current.SIGN_IN__PASSWORD,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(context),
        FormBuilderValidators.minLength(context, 8)
      ]),
    );
  }

  Widget _buildUserNameField() {
    return TextInputField(
      name: USER_NAME_KEY,
      labelText: S.current.SIGN_IN__EMAIL,
      initialValue: 'test@gmail.co',
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(context),
        FormBuilderValidators.email(context)
      ]),
      autofillHints: const [AutofillHints.email],
    );
  }

  Widget _buildLoginButton() {
    return Row(children: [
      Flexible(
          child: ClayContainer(
        color: AppColors.primaryLightColor,
        curveType: CurveType.none,
        borderRadius: AppDimensions.roundedRadius,
        child: BlocBuilder<SignInCubit, SignInState>(
          buildWhen: (_, current) => current is LoadingState,
          builder: (_, state) {
            final isLoading = (state is LoadingState) ? state.isLoading : false;
            return AppButton(
                loading: isLoading,
                shape: AppButtonShape.Rounded,
                color: AppColors.primaryColor500,
                textColor: AppColors.textLightColor,
                block: true,
                onPressed: () async {
                  final isValid = _formKey.currentState?.validate();

                  if (isValid == true) {
                    signInCubit.onSignInPressed(
                        _formKey.currentState
                                ?.getRawValue<String>(USER_NAME_KEY) ??
                            '',
                        _formKey.currentState
                                ?.getRawValue<String?>(PASSWORD_KEY) ??
                            '');
                  }
                },
                text: S.current.SIGN_IN__TEXT);
          },
        ),
      )),
    ]);
  }
}
