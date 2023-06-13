import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inci_kuruyemis/feature/profil/widgets/profile_elevated_button.dart';
import 'package:inci_kuruyemis/feature/profil/widgets/profile_text_field.dart';
import 'package:inci_kuruyemis/product/utility/constants/string_constants.dart';
import 'package:inci_kuruyemis/product/widgets/appBar/custom_app_bar.dart';
import '../../product/utility/spacer/spacer_utility.dart';
import '../../product/widgets/texts/body/body_large_1.dart';
import '../../product/widgets/texts/headline/headline_small_1.dart';

@RoutePage()
class ProfilView extends StatefulWidget {
  const ProfilView({super.key});

  @override
  State<ProfilView> createState() => _ProfilViewState();
}

class _ProfilViewState extends State<ProfilView> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _pinputController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _pinputController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(title: StringConstants.profilim),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpacerUtility.largeXXX,
              Center(
                child: HeadlineSmall1(text: StringConstants.hosGeldiniz),
              ),
              SpacerUtility.largeX,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BodyLarge1(
                      text: StringConstants.cepTelefonuNumarasi,
                    ),
                    SpacerUtility.smallXX,
                    BodyLarge1(
                      text: StringConstants.girisIcinSms,
                    ),
                    SpacerUtility.mediumXX,
                    ProfileTextField(
                      controller: _controller,
                    ),
                    ProfileElevatedButton(
                      controller: _pinputController,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
