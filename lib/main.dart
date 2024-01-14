import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:starter/utils/color_scheme/color_schemes.dart';
import 'package:starter/utils/constants.dart';
import 'package:starter/utils/di.dart';
import 'package:starter/utils/providers.dart';
import 'package:starter/utils/routing/routes.dart';
import 'package:starter/utils/ui_const.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');
  await Hive.initFlutter();
  await Hive.openBox(AppConst.tokenBox);
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );

  initDi();

  Intl.defaultLocale = 'pl_PL';
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: Providers.getProviders(),
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        title: 'Ozc',
        theme: ThemeData(
            visualDensity: VisualDensity.compact,
            useMaterial3: true,
            colorScheme: lightColorScheme,
            bottomNavigationBarTheme: CustomTheme.bottomNavigationBarThemeData,
            appBarTheme: CustomTheme.appBarTheme,
            fontFamily: GoogleFonts.oswald().fontFamily),
        darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      ),
    );
  }
}
