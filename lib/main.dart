import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';

void main() => runApp(_DayNightSwitcherExample());

class _DayNightSwitcherExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DayNightSwitcherExampleState();
}

class _DayNightSwitcherExampleState extends State<_DayNightSwitcherExample> {
  bool isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Day-Night Switcher ',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(color: const Color(0xFF253341)),
        scaffoldBackgroundColor: const Color(0xFF15202B),
      ),
      themeMode: isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text('Day-Night Switcher')),
          body: SizedBox.expand(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DayNightSwitcher(
                  isDarkModeEnabled: isDarkModeEnabled,
                  onStateChanged: onStateChanged,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2),
                  child: DayNightSwitcherIcon(
                    isDarkModeEnabled: isDarkModeEnabled,
                    onStateChanged: onStateChanged,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text('Dark mode is ' +
                      (isDarkModeEnabled ? 'enabled' : 'disabled') +
                      '.'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onStateChanged(bool isDarkModeEnabled) {
    setState(() {
      this.isDarkModeEnabled = isDarkModeEnabled;
    });
  }
}
