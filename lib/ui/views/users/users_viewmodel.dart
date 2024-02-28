import 'package:stacked/stacked.dart';
import 'package:stacked_app/app/app.locator.dart';
import 'package:stacked_app/models/user.dart';
import 'package:stacked_app/services/user_service.dart';
import 'package:stacked_services/stacked_services.dart';

class UsersViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();

  List<User> _users = [];
  List<User> get users => _users;

  getUserFromService() async {
    _users = await _userService.getUsers();
    rebuildUi();
  }

  String addressFromUser(User user){
    return 'Address: ${user.address.suite}, ${user.address.street}, ${user.address.city}, ${user.address.zipcode} ';
  }

  navigatehomeView() {
    _navigationService.back();
  }
}
