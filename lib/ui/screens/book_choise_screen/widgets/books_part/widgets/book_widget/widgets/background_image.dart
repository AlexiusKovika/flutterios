import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../blocs/book_bloc/book_bloc.dart';
import '../../../../../../../../blocs/book_bloc/book_bloc_states.dart';
import '../../../../../../../../helper_entities/images.dart';

class BackGroundImage extends StatelessWidget {
  final int index;
  const BackGroundImage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final bookBlocState =
        BlocProvider.of<BookBloc>(context).state as BookBlocDataLoadedState;
    return FancyShimmerImage(
      boxFit: BoxFit.fitWidth,
      imageUrl:
          bookBlocState.data[index].coverUrl ?? AssetImages.loadingErrorImage,
    );
  }
}
