import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inci_kuruyemis/product/utility/constants/string_constants.dart';
import 'package:inci_kuruyemis/product/utility/spacer/spacer_utility.dart';
import 'package:inci_kuruyemis/product/widgets/appBar/custom_app_bar.dart';
import 'package:inci_kuruyemis/product/widgets/button/pop_button.dart';

import '../../product/utility/colors/color_utility.dart';
import '../../product/utility/sizes/widget_size.dart';
import '../../product/widgets/text/title/title_small_1.dart';
import '../../product/widgets/textFormField/custom_text_form_field.dart';

@RoutePage()
class SatinAlmaView extends StatefulWidget {
  const SatinAlmaView({super.key});

  @override
  State<SatinAlmaView> createState() => _SatinAlmaViewState();
}

class _SatinAlmaViewState extends State<SatinAlmaView> {
  final TextEditingController _ulkeController = TextEditingController();
  final TextEditingController _sehirController = TextEditingController();
  final TextEditingController _ilceController = TextEditingController();
  final TextEditingController _adresController = TextEditingController();
  final TextEditingController _aliciAdSoyadController = TextEditingController();
  final TextEditingController _aliciTelefonController = TextEditingController();
  final _globalKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _ulkeController.dispose();
    _sehirController.dispose();
    _ilceController.dispose();
    _adresController.dispose();
    _aliciAdSoyadController.dispose();
    _aliciTelefonController.dispose();
  }

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
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: SizedBox(
        height: WidgetSizes.purchaseFloatingActionHeight,
        width: WidgetSizes.purchaseFloatingActionWidth,
        child: FloatingActionButton.extended(
          heroTag: null,
          highlightElevation: 1,
          focusElevation: 1,
          elevation: 1,
          splashColor: ColorUtility.yellowColor,
          backgroundColor: Colors.amber,
          onPressed: () {
            _isValidate();
          },
          label: const TitleSmall1(
            text: StringConstants.devamEt,
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(
        title: StringConstants.alisverisIlerle,
        leading: PopButton(),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _globalKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              children: [
                SpacerUtility.smallXXX,
                CustomTextFormField(
                  controller: _ulkeController,
                  labelText: StringConstants.ulke,
                  textInputType: TextInputType.streetAddress,
                  height: WidgetSizes.profilTextFieldHeight,
                  width: double.infinity,
                  validator: (p0) =>
                      p0!.isEmpty ? StringConstants.buAlanBosGecilemez : null,
                ),
                CustomTextFormField(
                    controller: _sehirController,
                    labelText: StringConstants.sehir,
                    textInputType: TextInputType.streetAddress,
                    height: WidgetSizes.profilTextFieldHeight,
                    width: double.infinity,
                    validator: (p1) => p1!.isEmpty
                        ? StringConstants.buAlanBosGecilemez
                        : null),
                CustomTextFormField(
                    controller: _ilceController,
                    labelText: StringConstants.ilce,
                    textInputType: TextInputType.streetAddress,
                    height: WidgetSizes.profilTextFieldHeight,
                    width: double.infinity,
                    validator: (p3) => p3!.isEmpty
                        ? StringConstants.buAlanBosGecilemez
                        : null),
                CustomTextFormField(
                    controller: _adresController,
                    labelText: StringConstants.detayliAdres,
                    textInputType: TextInputType.streetAddress,
                    height: WidgetSizes.profilTextFieldHeight,
                    width: double.infinity,
                    validator: (p4) => p4!.isEmpty
                        ? StringConstants.buAlanBosGecilemez
                        : null),
                CustomTextFormField(
                    controller: _aliciAdSoyadController,
                    labelText: StringConstants.aliciAdSoyad,
                    textInputType: TextInputType.name,
                    height: WidgetSizes.profilTextFieldHeight,
                    width: double.infinity,
                    validator: (p5) => p5!.isEmpty
                        ? StringConstants.buAlanBosGecilemez
                        : null),
                CustomTextFormField(
                    controller: _aliciTelefonController,
                    labelText: StringConstants.aliciTelNo,
                    textInputType: TextInputType.phone,
                    height: WidgetSizes.profilTextFieldHeight,
                    width: double.infinity,
                    validator: (p6) => p6!.isEmpty
                        ? StringConstants.buAlanBosGecilemez
                        : null),
                SpacerUtility.huge
              ],
            ),
          ),
        ),
      ),
    );
  }
}
