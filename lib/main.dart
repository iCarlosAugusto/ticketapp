import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ticketapp/firebase_options.dart';
import 'package:ticketapp/pages/signin/signin.page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.black.withOpacity(0.9),
        ),
        timePickerTheme: const TimePickerThemeData(
          backgroundColor: Colors.white,
          dialBackgroundColor: Colors.white,
          dialTextStyle: TextStyle(
            fontFamily: 'Sora',
          ),
          helpTextStyle: TextStyle(
            fontFamily: 'Sora',
            fontWeight: FontWeight.w800,
            fontSize: 16
          ),
        ),
        dividerTheme: DividerThemeData(
          space: 35,
          color: Colors.grey.withOpacity(0.2)
        ),
        listTileTheme: const ListTileThemeData(
          contentPadding: EdgeInsets.zero,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              )
            )
          )
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.black),
          )
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[200],
          suffixIconColor: Colors.black.withOpacity(0.2),
          iconColor: const Color(0xFF272727).withOpacity(0.5),
          prefixIconColor: Colors.black.withOpacity(0.2),
          contentPadding:const EdgeInsets.only(left: 16, top: 23, right: 16, bottom: 23),
          hintStyle: TextStyle(
            fontFamily: 'Sora',
            color: Colors.black.withOpacity(0.6),
            fontWeight: FontWeight.w300
          ),
          errorStyle: const TextStyle(
            fontFamily: 'Sora',
            fontWeight: FontWeight.w800,
            color: Colors.red
          ),
          floatingLabelStyle: TextStyle(
            fontFamily: 'Sora',
            color: const Color(0xFF272727).withOpacity(0.5),
          ),
          labelStyle: TextStyle(
            color: const Color(0xFF272727).withOpacity(0.5),
            fontFamily: 'Sora'
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.black.withOpacity(0.1))
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.red)
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.black.withOpacity(0.1))
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          enableFeedback: false,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          elevation: 0,
          selectedItemColor: Colors.white,
          unselectedItemColor: Color.fromARGB(185, 255, 255, 255),
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            fontFamily: "Sora"
          ),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            fontFamily: "Sora"
          )
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Signin(),
    );
  }
}
