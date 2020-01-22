import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import model
import 'package:mvc_demo/models/home/home_model.dart';
// import controller
import 'package:mvc_demo/controllers/home/home_controller.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeController viewController = HomeController();
    return ChangeNotifierProvider<HomeModel>(
      create: (context) => HomeModel.instance(),
      child: Consumer<HomeModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text("MVC Demo"),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                viewController.getter(context);
              },
              child: Icon(Icons.refresh),
            ),
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                (viewModel.status == HomeModelStatus.Loading)
                    ? LinearProgressIndicator()
                    : Container(),
                Expanded(
                  flex: 1,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: viewModel.photos.length,
                    itemBuilder: (context, index) {
                      return Image.network(
                        viewModel.photos[index].thumbnailUrl,
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
