import 'package:flutter/material.dart';
import 'package:my_book/helper_entities/pair.dart';

import '../entities/user_details.dart';

class ScreenArguments {
  final Pair<int, UserDetails?> data;
  final BuildContext context;

  ScreenArguments({required this.data, required this.context});
}
