import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:money_tracker/bloc/money_bloc.dart';
import 'package:money_tracker/screens/main_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),);
  runApp(const MyApp()); 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (_)=>MoneyBloc(initialDateTime: DateTime.now())),
      ],
      child: MaterialApp(
        theme:_buildTheme(Brightness.dark),
        title: 'Seu dinheiro',
        home: MainScreen(),
      ),
    );
  }
}

ThemeData _buildTheme(brightness) {
  var baseTheme = ThemeData(brightness: brightness);

  return baseTheme.copyWith(
    textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme),
  );
}