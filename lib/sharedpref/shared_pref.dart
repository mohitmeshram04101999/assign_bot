
import 'package:assignbot/sharedpref/user_pref_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference{
  Future<bool> saveUser (UserPrefModel responseModal)async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', responseModal.token.toString());
    sp.setInt('userId', responseModal.userId!);
    sp.setString('userType',responseModal.userType.toString());
    sp.setBool('isLogin',responseModal.isLogin!);

    return true;
  }

  Future<void> logOut() async
  {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
  }



  Future<UserPrefModel> getUser()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString("token");
    int? userId = sp.getInt("userId");
    String? userType = sp.getString("userType");
    bool? isLogin = sp.getBool("isLogin");

    return UserPrefModel(
      token: token,
      isLogin: isLogin,
      userId: userId,
      userType:userType,

    );
  }
  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool success = await sp.clear();
    print('User data cleared: $success'); // Debug log
    return success;
  }


  Future<void> clearToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.remove('token');
    print('Token removed from SharedPreferences'); // Debug log
  }


}