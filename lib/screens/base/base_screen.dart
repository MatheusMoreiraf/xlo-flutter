import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xlo/blocs/drawer_bloc.dart';
import 'package:xlo/screens/create/create_screen.dart';
import 'package:xlo/screens/home/home_screen.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final PageController _pageController = PageController();
  DrawerBloc _drawerBloc;
  StreamSubscription _drawerSubcription;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final DrawerBloc drawerBloc = Provider.of<DrawerBloc>(context);
    if (drawerBloc != _drawerBloc) {
      _drawerBloc = drawerBloc;

      _drawerSubcription?.cancel();
      _drawerSubcription = _drawerBloc.outPage.listen((page) {
        try {
          _pageController.jumpToPage(page);
        } catch (e) {}
      });
    }
  }

  @override
  void dispose() {
    _drawerSubcription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          HomeScreen(),
          CreateScreen(),
          Container(color: Colors.red),
          Container(color: Colors.blue),
          Container(color: Colors.red),
        ],
      ),
    );
  }
}
