import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_book/blocs/user_bloc/user_bloc.dart';
import 'package:my_book/blocs/user_bloc/user_bloc_states.dart';
import 'package:my_book/helper_entities/colors.dart';

import '../../../../../../helper_entities/images.dart';

class AvatarImageWidget extends StatefulWidget {
  const AvatarImageWidget({super.key});

  @override
  State<AvatarImageWidget> createState() => _AvatarImageWidgetState();
}

class _AvatarImageWidgetState extends State<AvatarImageWidget> {
  bool isErrored = false;
  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    return BlocBuilder<UserBloc, UserBlocState>(
      builder: (context, state) {
        return Container(
          height: MediaQuery.of(context).size.height / 3.3,
          width: MediaQuery.of(context).size.height / 3.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1000),
          ),
          clipBehavior: Clip.antiAlias,
          child: Image.network(
            isErrored
                ? AssetImages.loadingErrorImage
                : userBloc.userDetails!.avatarURL!,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              color: AppElementColors.clickedBlue,
              child: Center(
                child: Text(
                  userBloc.userDetails!.login![0].toUpperCase(),
                  style: TextStyle(
                    fontSize: 60,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                color: AppElementColors.disabledGrey,
                child: Center(
                  child: Center(
                    child: LoadingAnimationWidget.staggeredDotsWave(
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
