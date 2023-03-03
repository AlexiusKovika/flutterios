import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book/blocs/book_bloc/book_bloc.dart';
import 'package:my_book/blocs/book_bloc/book_bloc_events.dart';

import '../../../../../blocs/book_bloc/book_bloc_states.dart';

class FilterDropdownWidget extends StatelessWidget {
  const FilterDropdownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookBloc, BookBlocState>(
      builder: (BuildContext context, state) {
        final bookBloc = BlocProvider.of<BookBloc>(context);
        if (state is BookBlocDataLoadedState) {
          return Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: DropdownButton<String>(
                  itemHeight: kMinInteractiveDimension + 15,
                  value: bookBloc.mainFilter,
                  icon: const Icon(Icons.arrow_drop_down),
                  elevation: 16,
                  isExpanded: true,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  underline: const SizedBox.shrink(),
                  onChanged: (String? value) {
                    bookBloc.add(BookBlocDataSortEvent(filter: value!));
                  },
                  items: bookBloc.filterParameters
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
