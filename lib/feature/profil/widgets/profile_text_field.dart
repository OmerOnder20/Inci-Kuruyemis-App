// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:inci_kuruyemis/product/widgets/textFormField/custom_text_form_field.dart';

import '../../../product/utility/constants/string_constants.dart';
import '../../../product/utility/sizes/widget_size.dart';

class ProfileTextField extends StatelessWidget {
  final TextEditingController controller;

  const ProfileTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
        validator: (p0) => p0!.length != 11 ? StringConstants.gecerliTelefonNumarasi : null,
        controller: controller,
        hintText: StringConstants.telefonNumarasi,
        textInputType: TextInputType.number,
        height: WidgetSizes.profilTextFieldHeight,
        width: double.infinity);
  }
}
