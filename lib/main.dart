import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ijdtask/modules/home/cubits/home_cubit.dart';

import 'config/navigation/navigation.dart';
import 'config/theme/light_theme.dart';
import 'core/services/bloc_observer.dart';
import 'core/utils/constants.dart';
import 'di_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  Bloc.observer = MyBlocObserver();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<HomeCubit>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      theme: lightTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.homeScreen,
      navigatorKey: NavigationService.navigationKey,
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      builder: (context, child) => Directionality(textDirection: TextDirection.rtl, child: child!),
      // localizationsDelegates: L10n.localizationDelegates,
      // supportedLocales: L10n.supportedLocales,
      // locale: BlocProvider.of<L10nCubit>(context, listen: true).appLocale,
    );
  }
}
