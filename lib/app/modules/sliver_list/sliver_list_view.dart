import 'package:flutter/material.dart';
import 'package:food/app/core/theme/space.dart';

import 'package:get/get.dart';

import 'sliver_list_controller.dart';

import 'package:dio/dio.dart' as d;
import 'package:get/get.dart' as g;

class SliverListView extends GetView<SliverListController> {
  // late FormData a;

  @override
  Widget build(BuildContext context) {
    return ex0();
  }

  Widget ex0() {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text("My App"),
          elevation: 6,
          snap: true,
          floating: true,
          pinned: true,
          expandedHeight: 200,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {},
            )
          ],
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(width: 50, height: 50, color: Colors.blue[100]),
              Container(width: 50, height: 50, color: Colors.blue[200]),
              Container(width: 50, height: 50, color: Colors.blue[300]),
              Container(width: 50, height: 50, color: Colors.blue[400]),
              Container(width: 50, height: 50, color: Colors.blue[500]),
            ],
          ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, childAspectRatio: 1.5),
          delegate: SliverChildListDelegate(
            [
              Container(color: Colors.red[100]),
              Container(color: Colors.red[200]),
              Container(color: Colors.red[300]),
              Container(color: Colors.red[400]),
              Container(color: Colors.red[500]),
              Container(color: Colors.red[600]),
            ],
          ),
        ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Container(
                color: Colors.purple[index * 100],
                child: Center(
                  child: Text("$index"),
                ),
              );
            },
            childCount: 10,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
          ),
        ),
        SliverFixedExtentList(
          delegate: SliverChildListDelegate([
            Container(color: Colors.lightBlue[100]),
            Container(color: Colors.lightBlue[200]),
            Container(color: Colors.lightBlue[300]),
            Container(color: Colors.lightBlue[400]),
            Container(color: Colors.lightBlue[500]),
            Container(color: Colors.lightBlue[600]),
            Container(color: Colors.lightBlue[700]),
            Container(color: Colors.lightBlue[800])
          ]),
          itemExtent: 150,
        )
      ],
    );
  }

  Widget ex1() {
    return ListView(children: <Widget>[
      Container(width: 50, height: 50, color: Colors.blue[100]),
      Container(width: 50, height: 50, color: Colors.blue[200]),
      Container(width: 50, height: 50, color: Colors.blue[300]),
      Container(width: 50, height: 50, color: Colors.blue[400]),
      Container(width: 50, height: 50, color: Colors.blue[500]),
    ]);
  }

  Widget ex2() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.purple[index * 100],
          height: spaceXXXXL,
          child: Center(child: Text("$index")),
        );
      },
    );
  }

  Widget ex3() {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1,
        mainAxisSpacing: spaceS,
        crossAxisSpacing: spaceS,
      ),
      children: <Widget>[
        Container(color: Colors.red[100]),
        Container(color: Colors.red[200]),
        Container(color: Colors.red[300]),
        Container(color: Colors.red[400]),
        Container(color: Colors.red[500]),
        Container(color: Colors.red[600]),
        Container(color: Colors.red[700]),
        Container(color: Colors.red[800]),
        Container(color: Colors.red[900]),
      ],
    );
  }

  Widget ex4() {
    return GridView.builder(
      itemCount: 4,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (_, index) {
        return FlutterLogo();
      },
    );
  }

  Widget ex5() {
    return GridView.extent(
      maxCrossAxisExtent: 150,
      children: <Widget>[
        FlutterLogo(),
        FlutterLogo(),
        FlutterLogo(),
        FlutterLogo(),
      ],
    );
  }
}
