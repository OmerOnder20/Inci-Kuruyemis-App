import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inci_kuruyemis/feature/login/viewModel/login_view_model.dart';
import 'package:inci_kuruyemis/product/utility/colors/color_utility.dart';
import 'package:inci_kuruyemis/product/utility/constants/string_constants.dart';
import 'package:inci_kuruyemis/core/spacer/spacer_utility.dart';
import 'package:inci_kuruyemis/product/widgets/appBar/custom_app_bar.dart';
import 'package:inci_kuruyemis/product/widgets/button/pop_button.dart';
import 'package:inci_kuruyemis/product/widgets/text/title/title_small_1.dart';
import 'package:inci_kuruyemis/product/widgets/textFormField/custom_text_form_field.dart';

@RoutePage()
class HaveAccView extends StatefulWidget {
  const HaveAccView({super.key});

  @override
  State<HaveAccView> createState() => _HaveAccViewState();
}

class _HaveAccViewState extends LoginViewModel {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _globalKey = GlobalKey<FormState>();

  bool _isValidate() {
    if (_globalKey.currentState != null) {
      if (_globalKey.currentState!.validate()) {
        print("is valid");
        return true;
      } else {
        print("is not valid");
        return false;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: StringConstants.hesap,
        leading: PopButton(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Form(
          key: _globalKey,
          child: Column(children: [
            SpacerUtility.mediumXX,
            CustomTextFormField(
              controller: usernameController,
              textInputType: TextInputType.number,
              labelText: StringConstants.telefonNumarasi,
              validator: (p0) =>
                  p0!.isEmpty ? StringConstants.buAlanBosGecilemez : null,
            ),
            SpacerUtility.medium,
            CustomTextFormField(
              suffixIcon: IconButton(
                icon: Icon(
                  passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: ColorUtility.blackColor,
                ),
                onPressed: changePasswordVisibility,
              ),
              obscureText: !passwordVisible,
              controller: passwordController,
              textInputType: TextInputType.emailAddress,
              labelText: StringConstants.sifre,
              validator: (p1) =>
                  p1!.isEmpty ? StringConstants.buAlanBosGecilemez : null,
            ),
            SpacerUtility.medium,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40.h, vertical: 20.w),
                elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                backgroundColor: Colors.amber,
              ),
              onPressed: () {
                _isValidate();
                if (usernameController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty) {
                  loginSendDatas(
                      usernameController.text, passwordController.text);
                }
              },
              child: const TitleSmall1(text: StringConstants.girisYap),
            ),
          ]),
        ),
      ),
    );
  }
}
