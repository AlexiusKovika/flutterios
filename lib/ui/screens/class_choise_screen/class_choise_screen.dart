import 'package:flutter/material.dart';
import 'package:my_book/ui/screens/class_choise_screen/widgets/classes_part/classes_part.dart';
import 'package:my_book/ui/screens/class_choise_screen/widgets/logo_title_part/logo_title_part.dart';

class ClassChoiseScreen extends StatelessWidget {
  const ClassChoiseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final userBloc = BlocProvider.of<UserBloc>(context);
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          LogoTitlePart(),
          Expanded(
            child: ClassesPart(),
          ),
        ],
      ),
    );
  }
}
