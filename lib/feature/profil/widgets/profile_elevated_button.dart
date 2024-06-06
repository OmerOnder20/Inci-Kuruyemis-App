import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inci_kuruyemis/product/widgets/text/headline/headline_small_1.dart';
import 'package:pinput/pinput.dart';

import '../../../product/navigator/app_router.dart';
import '../../../product/utility/colors/color_utility.dart';
import '../../../product/utility/constants/string_constants.dart';
import '../../../core/size/sizes.dart';
import '../../../product/utility/sizes/widget_size.dart';
import '../../../core/spacer/spacer_utility.dart';
import '../../../product/widgets/text/body/body_large_2.dart';
import '../../../product/widgets/text/body/body_medium_1.dart';
import '../../../product/widgets/text/label/label_large_2.dart';

class ProfileElevatedButton extends StatefulWidget {
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;

  const ProfileElevatedButton({
    super.key,
    required this.controller,
    required this.formKey,
  });

  @override
  State<ProfileElevatedButton> createState() => _ProfileElevatedButtonState();
}

class _ProfileElevatedButtonState extends State<ProfileElevatedButton> {
  final GlobalKey<FormState> _pinputFormKey = GlobalKey();

  bool _pinputValidate() {
    if (_pinputFormKey.currentState != null) {
      if (_pinputFormKey.currentState!.validate()) {
        return true;
      } else {
        false;
      }
    }
    return false;
  }

  bool _isValidate() {
    if (widget.formKey.currentState != null) {
      if (widget.formKey.currentState!.validate()) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: WidgetSizes.profilElevatedButtonHeight,
        width: double.infinity,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: ColorUtility.blackColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60))),
            onPressed: () {
              if (_isValidate()) {
                showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: ColorUtility.scaffoldBackGroundColor,
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                  context: context,
                  builder: (context) {
                    return SizedBox(
                      height: WidgetSizes.profilBottomSheetHeight,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 30.h,
                        ),
                        child: Form(
                          key: _pinputFormKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 30.w),
                                  child: const HeadlineSmall1(
                                      text: StringConstants
                                          .telefonNumarasiDogrulayin),
                                ),
                                SpacerUtility.smallXX,
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 30.w),
                                  child: const LabelLarge2(
                                      text: StringConstants
                                          .dogrulamaKodunuGiriniz),
                                ),
                                SpacerUtility.mediumXXX,
                                Center(
                                  child: Pinput(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    androidSmsAutofillMethod:
                                        AndroidSmsAutofillMethod
                                            .smsUserConsentApi,
                                    forceErrorState: true,
                                    textInputAction: TextInputAction.send,
                                    controller: widget.controller,
                                    onTap: () {
                                      widget.controller.clear();
                                    },
                                    validator: (value) {
                                      if (value?.length != 5) {
                                        return StringConstants
                                            .buAlanBosGecilemez;
                                      } else {
                                        return null;
                                      }
                                    },
                                    separatorPositions: [1, 2, 3, 4],
                                    separator: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5.w),
                                      child: Container(
                                        height: 1.h,
                                        width: 10.w,
                                        color: ColorUtility.greyColor,
                                      ),
                                    ),
                                    length: 5,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    errorTextStyle: GoogleFonts.poppins(
                                        letterSpacing: 0,
                                        color: ColorUtility.redColor,
                                        fontWeight: FontWeight.w600,
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyLarge),
                                    errorPinTheme: PinTheme(
                                        textStyle: GoogleFonts.poppins(
                                            letterSpacing: 0,
                                            color: ColorUtility.textColorBlack,
                                            fontWeight: FontWeight.w600,
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .bodyLarge),
                                        width: WidgetSizes.profilPinputWidth,
                                        height: WidgetSizes.profilPinputHeight,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: ColorUtility
                                                .scaffoldBackGroundColor,
                                            border: Border.all(
                                                width: 1.w,
                                                color:
                                                    ColorUtility.greyColor))),
                                    defaultPinTheme: PinTheme(
                                        textStyle: GoogleFonts.poppins(
                                            letterSpacing: 0,
                                            color: ColorUtility.textColorBlack,
                                            fontWeight: FontWeight.w600,
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .bodyLarge),
                                        width: WidgetSizes.profilPinputWidth,
                                        height: WidgetSizes.profilPinputHeight,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: ColorUtility
                                                .scaffoldBackGroundColor,
                                            border: Border.all(
                                                width: 1.w,
                                                color:
                                                    ColorUtility.greyColor))),
                                  ),
                                ),
                                SpacerUtility.smallXX,
                                Padding(
                                  padding: EdgeInsets.only(left: 30.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          TextButton(
                                              style: TextButton.styleFrom(
                                                padding: EdgeInsets.zero,
                                                foregroundColor: ColorUtility
                                                    .scaffoldBackGroundColor,
                                              ),
                                              onPressed: () {
                                                if (_pinputValidate()) {
                                                  context.router.replace(
                                                      const ProfilDetayRoute());
                                                }
                                              },
                                              child: const BodyLarge2(
                                                  text:
                                                      StringConstants.devamEt)),
                                          Padding(
                                            padding: EdgeInsets.only(left: 5.w),
                                            child: Icon(
                                              Icons.arrow_forward_rounded,
                                              size: SizeUtility.mediumX.h,
                                              color:
                                                  ColorUtility.textColorBlack,
                                            ),
                                          )
                                        ],
                                      ),
                                      TextButton(
                                          style: TextButton.styleFrom(
                                            padding: EdgeInsets.zero,
                                            foregroundColor: ColorUtility
                                                .scaffoldBackGroundColor,
                                          ),
                                          onPressed: () {},
                                          child: const BodyLarge2(
                                              text: StringConstants
                                                  .koduTekrarGonder)),
                                      Row(
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsets.only(right: 10.w),
                                            child: Icon(
                                              Icons.arrow_back_rounded,
                                              size: SizeUtility.mediumX.h,
                                              color:
                                                  ColorUtility.textColorBlack,
                                            ),
                                          ),
                                          TextButton(
                                              style: TextButton.styleFrom(
                                                padding: EdgeInsets.zero,
                                                foregroundColor: ColorUtility
                                                    .scaffoldBackGroundColor,
                                              ),
                                              onPressed: () {
                                                context.router.pop();
                                                widget.controller.clear();
                                              },
                                              child: const BodyLarge2(
                                                text: StringConstants.geriDon,
                                              )),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ]),
                        ),
                      ),
                    );
                  },
                );
              }
              ;
            },
            child: const BodyMedium1(
              text: StringConstants.devamEt,
            )),
      ),
    );
  }
}
