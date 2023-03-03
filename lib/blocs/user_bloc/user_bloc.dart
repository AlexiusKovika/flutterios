import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book/blocs/user_bloc/user_bloc_events.dart';
import 'package:my_book/blocs/user_bloc/user_bloc_states.dart';
import 'package:my_book/domen/api_client/api_client.dart';
import 'package:my_book/domen/repository/main_repository.dart';
import 'package:my_book/entities/backpack_book.dart';
import 'package:my_book/entities/user_details.dart';
import 'package:my_book/helper_entities/exceptions.dart';
import 'package:my_book/helper_entities/radio.dart';
import 'package:my_book/ui/router/main_router.dart';

import '../../entities/school.dart';
import '../../entities/user.dart';
import '../../helper_entities/images.dart';
import '../../ui/screens/backpack_screen/books_part/widgets/book_widget/book_widget.dart';

class UserBloc extends Bloc<UserBlocEvent, UserBlocState> {
  final downloadingBooks = [];
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  BuildContext? mainContext;
  User? user;
  UserDetails? userDetails;
  List<BackpackBook>? userBackpack;
  List<BackpackBook>? classBackpack;
  List<BackpackBook>? musicClassBackpack;
  List<int>? booksIds;
  String? fullNameResponse;
  String? loginResponse;
  String? mailResponse;
  List<School>? commonSchools;
  List<School>? musicalSchools;
  String? pickedCommonSchool;
  String? pickedMusicalSchool;
  String? pickedClass;
  double? offset = 0;
  RadioCharacter character = RadioCharacter.user;
  final fullNameController = TextEditingController();
  final loginController = TextEditingController();
  final mailController = TextEditingController();
  final schoolController = TextEditingController();
  final _repo = MainRepository();

  UserBloc({this.user, this.userDetails, required this.mainContext})
      : super(UserBlocInitState()) {
    on<UserBlocGetFullInfoEvent>(_getFullInfo);
    on<UserBlocRewriteEvent>(_rewrite);
    on<UserBlocAuthWithInnerTokenEvent>(_authWithInnerToken);
    on<UserBlocIsNotAuthEvent>(_isNotAuth);
    on<UserBlocBackpackReloadEvent>(_reloadBackpack);
    on<UserBlocAddBookToBackpackEvent>(_addToBackpack);
    on<UserBlocRemoveBookFromBackpackEvent>(_removeFromBackpack);
    on<UserBlocUpdateUserInfoEvent>(_updateUser);
    on<UserBlocCommonSchoolChangeEvent>(_changeCommonSchool);
    on<UserBlocMusicalSchoolChangeEvent>(_changeMusicalSchool);
    on<UserBlocClassChangeEvent>(_changeClass);
    on<UserBlocChangeAvatarEvent>(_changeAvatar);
    on<UserBlocReloadFromUserDetailsEvent>(_reloadFromUserDetails);
    on<UserBlocChangeCharacterEvent>(_changeCharacter);
    on<UserBlocDownloadBookEvent>(_downloadBook);
  }

  void _getFullInfo(event, emit) async {
    if (user?.token != null) {
      try {
        userDetails = await ApiClient.authMe(user?.token);
        userDetails!.token = user!.token;

        commonSchools = await ApiClient.getCommonSchools();

        musicalSchools = await ApiClient.getMusicalSchools();

        userBackpack = await ApiClient.getUserBackpack(
            userDetails!.backpackId!, userDetails!.token!);

        classBackpack = await ApiClient.getClassBackpack(
          int.tryParse(userDetails!.schoolClass.toString()),
          userDetails!.name,
          userDetails!.token!,
        );

        _writeData();

        musicClassBackpack = await ApiClient.getMusicClassBackpack(
            pickedMusicalSchool, userDetails!.token!);

        emit(UserBlocDataLoadedState());
        _repo.writetoken(user!.token!);
      } catch (e) {
        print(e);
      }
    } else {
      emit(UserBlocIsNotAuthState());
    }
  }

  void _updateUser(event, emit) async {
    try {
      final response = await ApiClient.update(
        musicalSchool: pickedMusicalSchool == musicalSchools![0].name
            ? null
            : pickedMusicalSchool,
        fullName: fullNameController.text,
        id: userDetails!.userId!,
        login: loginController.text == 'Логін вже зайнятий'
            ? userDetails!.login!
            : loginController.text,
        mail: mailController.text == 'Пошта вже зайнята' ||
                mailController.text == '' ||
                mailController.text == 'Пошту не задано'
            ? userDetails!.mail
            : mailController.text,
        commonSchool: pickedCommonSchool == commonSchools![0].name
            ? null
            : pickedCommonSchool,
        schoolClass: pickedClass == 'Клас не обрано' ? null : pickedClass,
        city: userDetails!.cityName!,
        token: userDetails!.token!,
      );
      final tempToken = response.token;
      userDetails = await ApiClient.authMe(tempToken);
      userDetails?.token = tempToken;

      commonSchools = await ApiClient.getCommonSchools();
      musicalSchools = await ApiClient.getMusicalSchools();

      userBackpack = await ApiClient.getUserBackpack(
        userDetails!.backpackId!,
        userDetails!.token!,
      );

      classBackpack = await ApiClient.getClassBackpack(
        int.tryParse(userDetails!.schoolClass.toString()),
        userDetails!.name,
        userDetails!.token!,
      );

      _writeData();

      musicClassBackpack = await ApiClient.getMusicClassBackpack(
          pickedMusicalSchool, userDetails!.token!);

      emit(UserBlocDataLoadedState());
      _repo.writetoken(userDetails!.token!);
    } on MyBookLoginDuplicatedException catch (e) {
      loginController.text = e.body;
      emit(UserBlocErrorState(loginErrorMessage: e.body));
    } on MyBookMailDuplicatedException catch (e) {
      mailController.text = e.body;
      emit(UserBlocErrorState(mailErrorMessage: e.body));
    }
  }

  void _changeAvatar(event, emit) async {
    final avatarUrl = await ApiClient.uploadImage(event.imagePath);
    await ApiClient.changeAvatar(
      avatarUrl: avatarUrl,
      token: userDetails!.token!,
      id: userDetails!.userId!,
    );
    add(UserBlocReloadFromUserDetailsEvent());
  }

  void _changeCharacter(event, emit) async {
    character = event.character;

    emit(UserBlocDataLoadedState());
  }

  void _rewrite(event, emit) async {
    if (userDetails != null) {
      commonSchools = await ApiClient.getCommonSchools();
      musicalSchools = await ApiClient.getMusicalSchools();

      userBackpack = await ApiClient.getUserBackpack(
        userDetails!.backpackId!,
        userDetails!.token!,
      );

      classBackpack = await ApiClient.getClassBackpack(
        int.tryParse(userDetails!.schoolClass.toString()),
        userDetails!.name,
        userDetails!.token!,
      );

      _writeData();

      musicClassBackpack = await ApiClient.getMusicClassBackpack(
          pickedMusicalSchool, userDetails!.token!);

      emit(UserBlocDataLoadedState());
    } else {
      emit(UserBlocIsNotAuthState());
    }
  }

  void _reloadFromUserDetails(event, emit) async {
    if (userDetails != null) {
      final tempToken = userDetails!.token;
      add(UserBlocGetFullInfoEvent(token: tempToken));

      emit(UserBlocDataLoadedState());
    } else {
      emit(UserBlocIsNotAuthState());
    }
  }

  void _authWithInnerToken(event, emit) async {
    String? innerToken;
    final repo = MainRepository();
    try {
      innerToken = await repo.readtoken();
    } catch (e) {
      innerToken = null;
    }

    try {
      userDetails = await ApiClient.authMe(innerToken);
    } catch (_) {
      userDetails = null;
    }

    if (userDetails == null) {
      MainRouter.animateToStartScreen(event.context);
    } else {
      userDetails?.token = innerToken;
      print(innerToken);

      commonSchools = await ApiClient.getCommonSchools();
      musicalSchools = await ApiClient.getMusicalSchools();

      userBackpack = await ApiClient.getUserBackpack(
        userDetails!.backpackId!,
        userDetails!.token!,
      );

      classBackpack = await ApiClient.getClassBackpack(
        int.tryParse(userDetails!.schoolClass.toString()),
        userDetails!.name,
        userDetails!.token!,
      );

      _writeData();

      musicClassBackpack = await ApiClient.getMusicClassBackpack(
        pickedMusicalSchool,
        userDetails!.token!,
      );

      emit(UserBlocDataLoadedState());
    }
  }

  void _isNotAuth(event, emit) async {
    user = null;
    userDetails = null;
    emit(UserBlocIsNotAuthState());
  }

  void _reloadBackpack(event, emit) async {
    userBackpack = await ApiClient.getUserBackpack(
        userDetails!.backpackId!, userDetails!.token!);
    booksIds = userBackpack!.map((e) => e.bookID!).toList();
    emit(UserBlocDataLoadedState());
  }

  void _addToBackpack(event, emit) async {
    await ApiClient.addBookToBackpack(event.data, userDetails!.token!);
    userBackpack = await ApiClient.getUserBackpack(
        userDetails!.backpackId!, userDetails!.token!);
    booksIds = userBackpack!.map((e) => e.bookID!).toList();
    emit(UserBlocDataLoadedState());
  }

  void _removeFromBackpack(event, emit) async {
    event.gridKey?.currentState!.removeItem(
      event.index,
      (context, animation) => BookWidget(
        index: event.index,
        backpack: userBackpack!,
        gridKey: event.gridKey,
        animation: animation,
      ),
    );
    await ApiClient.removeBookFromBackpack(event.data, userDetails!.token!);
    userBackpack = await ApiClient.getUserBackpack(
        userDetails!.backpackId!, userDetails!.token!);
    booksIds = userBackpack!.map((e) => e.bookID!).toList();
    add(UserBlocBackpackReloadEvent());
  }

  void _changeCommonSchool(event, emit) {
    pickedCommonSchool = event.school;
    emit(UserBlocDataLoadedState());
  }

  void _changeMusicalSchool(event, emit) {
    pickedMusicalSchool = event.school;
    emit(UserBlocDataLoadedState());
  }

  void _changeClass(event, emit) {
    pickedClass = event.userClass;
    emit(UserBlocDataLoadedState());
  }

  void _writeData() {
    fullNameController.text = userDetails?.fullName ?? 'ПІБ невідоме';
    loginController.text = userDetails?.login ?? 'Логін невідомий';
    mailController.text = userDetails?.mail ?? 'Пошту не задано';
    schoolController.text = userDetails?.name ?? 'Школа невідома';

    fullNameResponse = userDetails?.fullName ?? 'unknown';
    loginResponse = userDetails?.login ?? 'unknown';
    mailResponse = userDetails?.mail ?? 'unknown';

    pickedCommonSchool = userDetails?.name ?? commonSchools![0].name;
    pickedMusicalSchool =
        userDetails?.extracurricularInstitution1 ?? musicalSchools![0].name;

    pickedClass = userDetails?.schoolClass ?? 'Клас не обрано';

    booksIds = userBackpack!.map((e) => e.bookID!).toList();
  }

  void _downloadBook(event, emit) async {
    BackpackBook book = BackpackBook();

    if (character == RadioCharacter.user) {
      book = userBackpack![event.index];
      downloadingBooks.add(userBackpack![event.index].bookID);
    } else if (character == RadioCharacter.commonUserClass) {
      book = classBackpack![event.index];
      downloadingBooks.add(classBackpack![event.index].bookID);
    } else {
      book = musicClassBackpack![event.index];
      downloadingBooks.add(musicClassBackpack![event.index].bookID);
    }

    emit(UserBlocDataLoadedState(bookIsDownload: true));

    final downloadPath = await _repo.getDownloadDirectory();
    final response = await ApiClient.downloadBook(book.bookUrl!);

    await MainRepository().saveDownloadedBook(
        downloadPath!, response, book.name!.replaceAll(r' ', '_'));

    if (mainContext!.mounted) {
      downloadingBooks.remove(book.bookID);
      emit(UserBlocDataLoadedState(bookIsDownload: true));
      bool isShowed = ModalRoute.of(mainContext!)?.isCurrent ?? false;
      showModalBottomSheet(
        context: mainContext!,
        backgroundColor: Colors.white.withOpacity(0.95),
        builder: (context) {
          if (!isShowed) {
            Navigator.of(context).pop();
          }
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AssetImages.bookDownloadSuccess,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Підручник успішно завантажено',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    // color: AppElementColors.lime,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          );
        },
      );

      Future.delayed(Duration(seconds: 3)).whenComplete(() {
        isShowed = ModalRoute.of(mainContext!)?.isCurrent ?? false;
        if (!isShowed) {
          Navigator.of(mainContext!).pop();
        }
      });
    } else {
      bool isShowed = ModalRoute.of(event.globalContext)?.isCurrent ?? false;
      showModalBottomSheet(
        context: event.globalContext,
        backgroundColor: Colors.white.withOpacity(0.95),
        builder: (context) {
          if (!isShowed) {
            Navigator.of(context).pop();
          }
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AssetImages.bookDownloadSuccess,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Підручник успішно завантажено',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    // color: AppElementColors.lime,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          );
        },
      );

      Future.delayed(Duration(seconds: 3)).whenComplete(() {
        isShowed = ModalRoute.of(event.globalContext)?.isCurrent ?? false;
        if (!isShowed) {
          Navigator.of(event.globalContext).pop();
        }
      });
    }
  }
}
