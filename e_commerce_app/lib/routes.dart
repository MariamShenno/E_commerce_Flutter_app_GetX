import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/middleware/mymiddleware.dart';
import 'package:e_commerce_app/view/address/add.dart';
import 'package:e_commerce_app/view/address/adddetails.dart';
import 'package:e_commerce_app/view/address/view.dart';
import 'package:e_commerce_app/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:e_commerce_app/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:e_commerce_app/view/screen/auth/signup.dart';
import 'package:e_commerce_app/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:e_commerce_app/view/screen/auth/success_signUp.dart';
import 'package:e_commerce_app/view/screen/auth/forgetpassword/verfiycode.dart';
// import 'package:e_commerce_app/view/screen/auth/verifycodesignup.dart';
import 'package:e_commerce_app/view/screen/cart.dart';
import 'package:e_commerce_app/view/screen/checkout.dart';
import 'package:e_commerce_app/view/screen/homescreen.dart';
import 'package:e_commerce_app/view/screen/items.dart';
import 'package:e_commerce_app/view/screen/language.dart';
import 'package:e_commerce_app/view/screen/myfavorite.dart';
import 'package:e_commerce_app/view/screen/offers.dart';
import 'package:e_commerce_app/view/screen/onboarding.dart';
import 'package:e_commerce_app/view/screen/orders/archive.dart';
import 'package:e_commerce_app/view/screen/orders/details.dart';
import 'package:e_commerce_app/view/screen/orders/pending.dart';
import 'package:e_commerce_app/view/screen/productdetails.dart';
import 'package:e_commerce_app/view/widget/orders/orderstracking.dart';
import 'package:get/get.dart';
import 'view/screen/auth/login.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => const Language(), middlewares: [
    MyMiddleWare(),
  ]),
  //Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  //GetPage(name: AppRoute.checkEmail, page: () => const CheckEmail()()),
  GetPage(
      name: AppRoute.successResetPassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  // GetPage(
  //     name: AppRoute.verifyCodeSignUp, page: () => const VerfiyCodeSignUp()),
  // OnBoarding
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  //Home
  GetPage(name: AppRoute.homePage, page: () => const HomeScreen()),
  //Items
  GetPage(name: AppRoute.items, page: () => const Items()),
  //ProductDetails
  GetPage(name: AppRoute.productdetails, page: () => const ProductDetails()),
  //MyFavorite
  GetPage(name: AppRoute.myfavroite, page: () => const MyFavorite()),
  //Cart
  GetPage(name: AppRoute.mycart, page: () => const Cart()),
  //Adress
  GetPage(name: AppRoute.addressview, page: () => const AddressView()),
  GetPage(name: AppRoute.addressadd, page: () => const AddressAdd()),
  GetPage(name: AppRoute.addressadddetails, page: () => const AddressAddDetails()),
  // CheckOut
  GetPage(name: AppRoute.checkout, page: () => const Checkout()),
  //Orders
  GetPage(name: AppRoute.orderspending, page: () => const OrdersPending()),
  GetPage(name: AppRoute.ordersarchive, page: () => const OrdersArchiveView()),
  GetPage(name: AppRoute.ordersdetails, page: () => const OrdersDetails()),
  GetPage(name: AppRoute.orderstracking, page: () => const OrdersTracking()),
  //Offers
  GetPage(name: AppRoute.offers, page: () => const OffersView()),
];
