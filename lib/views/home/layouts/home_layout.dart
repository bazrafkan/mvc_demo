import 'package:flutter/material.dart';
import 'package:mvc_demo/controllers/home/home_controller.dart';
import 'package:mvc_demo/models/home/home_model.dart';
import 'package:mvc_demo/views/home/components/photo_card.dart';
import 'package:mvc_demo/views/home/components/photo_error_card.dart';
import 'package:provider/provider.dart';

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeController viewController = HomeController();
    final viewModel = Provider.of<HomeModel>(context);
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
      body: (viewModel.status != HomeModelStatus.Error)
          ? Column(
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
                      return PhotoCard(
                        thumbnailUrl: viewModel.photos[index].thumbnailUrl,
                      );
                    },
                  ),
                ),
              ],
            )
          : PhotoErrorCard(errorMessage: viewModel.errorMessage),
    );
  }
}
