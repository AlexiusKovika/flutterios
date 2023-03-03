import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_book/blocs/user_bloc/user_bloc_events.dart';
import 'package:my_book/blocs/user_bloc/user_bloc_states.dart';
import 'package:my_book/helper_entities/pair.dart';
import 'package:my_book/ui/screens/book_choise_screen/widgets/books_part/books_part.dart';
import 'package:my_book/helper_entities/colors.dart';
import 'package:my_book/ui/screens/book_choise_screen/widgets/filter_dropdown/filter_drodown.dart';

import '../../../blocs/user_bloc/user_bloc.dart';
import '../../screen_independent_widgets/logos_with_margin.dart';

class BookChoiseScreen extends StatelessWidget {
  final Pair data;
  const BookChoiseScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      backgroundColor: AppElementColors.backgroundGrey,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BlocBuilder<UserBloc, UserBlocState>(
          builder: (context, state) {
            if (state is UserBlocInitState) {
              userBloc.add(UserBlocRewriteEvent());
              return Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                  color: AppElementColors.clickedBlue,
                  size: 50,
                ),
              );
            } else {
              return Container(
                padding: const EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const TopLogoPartWithMargin(),
                    const FilterDropdownWidget(),
                    Expanded(
                      child: BooksPart(
                        userClass: data.left as int,
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
