import 'package:flutter/material.dart';
import 'package:mvc_demo/views/home/layouts/home_layout.dart';
import 'package:provider/provider.dart';
// import model
import 'package:mvc_demo/models/home/home_model.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeModel>(
      create: (context) => HomeModel.instance(),
      child: Consumer<HomeModel>(
        builder: (context, viewModel, child) {
          return HomeLayout();
        },
      ),
    );
  }
}
