import 'package:flutter/material.dart';

import '../../core/themes/app_theme.dart';
import 'app_texts.dart';

class AppPage extends StatelessWidget {
  final Widget body;
  final Widget? appBar;
  const AppPage({
    Key? key,
    required this.body,
    this.appBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (appBar != null) {
      return Scaffold(
        backgroundColor: AppTheme.of(context).backgroundColor,
        body: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [appBar!],
            floatHeaderSlivers: true,
            physics: const BouncingScrollPhysics(),
            body: body,
          ),
        ),
      );
    }
    return Scaffold(
      backgroundColor: AppTheme.of(context).backgroundColor,
      body: SafeArea(
        child: body,
      ),
    );
  }
}

class AppTab extends StatelessWidget {
  final Widget body;
  final Widget appBar;
  const AppTab({
    Key? key,
    required this.body,
    required this.appBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [appBar],
      floatHeaderSlivers: true,
      physics: const BouncingScrollPhysics(),
      body: body,
    );
  }
}

class AppNavPage extends StatelessWidget {
  final Widget body;
  final Widget navBar;
  const AppNavPage({
    Key? key,
    required this.body,
    required this.navBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.of(context).backgroundColor,
      body: SafeArea(child: body),
      bottomNavigationBar: navBar,
    );
  }
}

class AppAppBar extends StatelessWidget {
  final String title;
  final List<Widget>? actions;
  const AppAppBar({
    Key? key,
    required this.title,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);

    return SliverAppBar(
      title: HeadlineMedium(text: title),
      elevation: 0,
      backgroundColor: appTheme.foregroundColor,
      foregroundColor: appTheme.onGroundColorLow,
      centerTitle: true,
      actions: actions,
    );
  }
}

class BottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onTapped;
  final List<BottomNavigationBarItem> items;
  const BottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onTapped,
    required this.items,
  }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int get selectedIndex => widget.selectedIndex;
  Function get onItemTapped => widget.onTapped;
  List<BottomNavigationBarItem> get items => widget.items;
  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    return BottomNavigationBar(
      items: items,
      type: BottomNavigationBarType.shifting,
      currentIndex: selectedIndex,
      selectedItemColor: appTheme.primaryColor,
      unselectedItemColor: appTheme.onGroundColorLow,
      iconSize: 40,
      onTap: (index) => onItemTapped(index),
      elevation: 5,
    );
  }
}
