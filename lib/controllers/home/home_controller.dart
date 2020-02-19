import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import model
import 'package:mvc_demo/models/home/home_model.dart';

class HomeController {
  HomeController();

  void getter(BuildContext context) {
    HomeModel viewModel = Provider.of<HomeModel>(context, listen: false);
    // Add code here for getter
    viewModel.getter();
  }

  void setter(BuildContext context) {
    HomeModel viewModel = Provider.of<HomeModel>(context, listen: false);
    // Add code here for setter
    viewModel.setter();
  }

  void update(BuildContext context) {
    HomeModel viewModel = Provider.of<HomeModel>(context, listen: false);
    // Add code here for update
    viewModel.update();
  }

  void remove(BuildContext context) {
    HomeModel viewModel = Provider.of<HomeModel>(context, listen: false);
    // Add code here for remove
    viewModel.remove();
  }
}
