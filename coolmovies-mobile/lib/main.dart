import 'package:coolmovies/app/app_binding.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app/commons/presenter/theme.dart';
import 'app/commons/utils/exports.dart';

void main() async {
  await initHiveForFlutter();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Routes.initial,
      initialBinding: AppBinding(),
      getPages: AppPages.routes,
      title: 'Cool Movies',
      theme: CustomTheme.build(),
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
      ],
    );
  }
}
