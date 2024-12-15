import 'package:quick_dine/screens/admin_home.dart';
import 'package:quick_dine/screens/home.dart';
import 'package:quick_dine/screens/kantinku.dart';
import 'package:quick_dine/screens/karyawan_home.dart';
import 'package:quick_dine/screens/manage_kantin.dart';
import 'package:quick_dine/screens/manage_menu.dart';
import 'package:quick_dine/screens/manage_user.dart';
import 'package:quick_dine/screens/menu_screen.dart';

class AppRoutes {
  static const String adminHome = '/admin/home';
  static const String manageUser = '/admin/user';
  static const String manageKantin = '/admin/kantin';

  static const String home = '/home';
  static const String menu = '/menu';

  static const String karyawanHome = '/karyawan/home';
  static const String manageMenu = '/karyawan/menu';
  static const String kantinku = '/karyawan/kantin';

  static final routes = {
    adminHome: (context) => AdminHome(),
    manageUser: (context) => ManageUser(),
    manageKantin: (context) => ManageKantin(),

    home: (context) => Home(),
    // menu: (context) => MenuScreen(),

    karyawanHome: (context) => KaryawanHome(),
    manageMenu: (context) => ManageMenu(),
    kantinku: (context) => KantinKu(),
    
  };
}
