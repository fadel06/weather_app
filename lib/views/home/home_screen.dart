import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/connection_provider.dart';
import 'package:weather_app/providers/region_provider.dart';

import 'form_section.dart';
import 'header_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ConnectionProvider>(
            create: (_) => ConnectionProvider()),
        ChangeNotifierProvider<RegionProvider>(create: (_) => RegionProvider())
      ],
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100.0),
              child: Consumer<RegionProvider>(builder: (context, provider, _) {
                return Column(
                  children: [
                    const HeaderSection(),
                    FormSection(
                      provider: provider,
                    )
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
