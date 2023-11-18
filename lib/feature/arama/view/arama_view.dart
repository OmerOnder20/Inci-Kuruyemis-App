import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:inci_kuruyemis/feature/arama/widgets/search_text_field.dart';

@RoutePage()
class AramaView extends StatefulWidget {
  const AramaView({super.key});

  @override
  State<AramaView> createState() => _AramaViewState();
}

class _AramaViewState extends State<AramaView> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SearchTextField(controller: _controller),
        ));
  }
}
