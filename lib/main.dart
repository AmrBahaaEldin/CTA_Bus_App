



// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:grade_project/generated/l10n.dart';
import 'package:grade_project/layout/Home_Screen/home_screen.dart';

import 'package:grade_project/shared/BlockobServer.dart';
import 'package:grade_project/shared/cubit/cubit.dart';
import 'package:grade_project/shared/cubit/state.dart';
import 'package:grade_project/shared/network/local/cache_helper.dart';
import 'package:grade_project/shared/styles/themes.dart';

import 'modules/Driver detector/driverDetector_screen.dart';
import 'modules/Login_Screen/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();//app not work before execute methods above runApp
 await CacheData.cacheInitialization();
bool ?isDark = CacheData.getData(key: 'isDark');
String ? selectedLanguage=CacheData.getData(key: 'selectedLanguage');
  Bloc.observer = MyBlocObserver();
  runApp( MyApp(isDark,selectedLanguage));
}
class MyApp extends StatelessWidget {
 final  isDark;
 final selectedLanguage;

   const MyApp(this.isDark,
       this.selectedLanguage,
       {super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     return    MultiBlocProvider(
         providers:[
       BlocProvider(create: (context) => AppCubit()
         ..changeTheme(
         statePage:isDark,)

         ..changeLanguage(
         stateLanguage: selectedLanguage,
       ),
       ),

     ],
         child: BlocConsumer<AppCubit,AppStates>(
           listener: (context, state) {

           },
           builder: (context, state) {
           AppCubit cubit= AppCubit.get(context);
        return   MaterialApp(


          locale: const Locale('ar'),
          ////////////language////////////////////
          localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
         
          ////////////////////////////////////////////////////////////////////////
          debugShowCheckedModeBanner: false,
          theme: lightTheme,

          darkTheme: darkTheme,

          themeMode:cubit.isDark ? ThemeMode.dark:ThemeMode.light,

          home:   const HomeScreen(),
        );
           },
             ));

  }
}



