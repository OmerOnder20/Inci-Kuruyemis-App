import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inci_kuruyemis/product/controller/global_controller.dart';
import 'package:inci_kuruyemis/product/widgets/appBar/custom_app_bar.dart';
import 'package:inci_kuruyemis/product/widgets/text/body/body_medium_1.dart';
import 'package:inci_kuruyemis/product/widgets/text/label/label_large_2.dart';
import 'package:provider/provider.dart';
import '../../../product/navigator/app_router.dart';
import '../../../product/utility/colors/color_utility.dart';
import '../../../product/utility/constants/string_constants.dart';
import '../../../product/utility/sizes/widget_size.dart';
import '../../../core/spacer/spacer_utility.dart';
import '../../../product/widgets/textFormField/custom_text_form_field.dart';
import '../../../product/widgets/text/headline/headline_small_2.dart';

@RoutePage()
class ProfilDetayView extends StatefulWidget {
  const ProfilDetayView({super.key});

  @override
  State<ProfilDetayView> createState() => _ProfilDetayViewState();
}

class _ProfilDetayViewState extends State<ProfilDetayView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isChecked = false;
  bool _isValidate() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
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
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _surnameController.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(title: StringConstants.profilDetay),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(children: [
            SpacerUtility.mediumXX,
            const Center(
              child: HeadlineSmall2(
                text: StringConstants.sonBirAdimKaldi,
              ),
            ),
            SpacerUtility.mediumXX,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomTextFormField(
                    controller: _nameController,
                    labelText: StringConstants.adiniz,
                    textInputType: TextInputType.name,
                    validator: (p0) =>
                        p0!.isEmpty ? StringConstants.buAlanBosGecilemez : null,
                  ),
                  SpacerUtility.smallXX,
                  CustomTextFormField(
                    controller: _surnameController,
                    labelText: StringConstants.soyadiniz,
                    textInputType: TextInputType.name,
                    validator: (p2) =>
                        p2!.isEmpty ? StringConstants.buAlanBosGecilemez : null,
                  ),
                  SpacerUtility.smallXX,
                  CustomTextFormField(
                    controller: _emailController,
                    labelText: StringConstants.epostaAdresiniz,
                    textInputType: TextInputType.emailAddress,
                  ),
                  SpacerUtility.smallXX,
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: SizedBox(
                height: WidgetSizes.profilCheckBoxRowHeight,
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Transform.scale(
                      scale: 1.1.h,
                      child: Checkbox(
                        shape: const CircleBorder(),
                        activeColor: ColorUtility.yellowColor,
                        value: isChecked,
                        checkColor: ColorUtility.greyColor,
                        side: BorderSide(
                          width: 2.w,
                          color: ColorUtility.greyColor,
                        ),
                        onChanged: (newBool) {
                          setState(() {
                            isChecked = newBool!;
                          });
                        },
                      ),
                    ),
                    const Flexible(
                      child: LabelLarge2(
                        text: StringConstants.uyelikSozlesmesini,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SpacerUtility.smallXXX,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: SizedBox(
                height: WidgetSizes.profilElevatedButtonHeight,
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorUtility.blackColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60))),
                    onPressed: isChecked
                        ? () {
                            if (_isValidate()) {
                              context
                                  .read<GlobalController>()
                                  .changeCompleted();
                              context.router.replace(const ProfilInfoRoute());
                            }
                          }
                        : null,
                    child: const BodyMedium1(
                      text: StringConstants.uyeOl,
                    )),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
