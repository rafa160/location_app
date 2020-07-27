import 'package:flutter/material.dart';
import 'package:locationapp/providers/places.dart';
import 'package:locationapp/routes/app_routes.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.PLACE_FORM);
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<Places>(context, listen: false).loadPlaces(),
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<Places>(
                    child: Center(
                      child: Text('No places here...'),
                    ),
                    builder: (context, places, child) => places.itemsCount == 0
                        ? child
                        : ListView.builder(
                            itemCount: places.itemsCount,
                            itemBuilder: (context, i) => Card(
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage:
                                      FileImage(places.getItem(i).image),
                                ),
                                title: Text(places.getItem(i).title),
                                onTap: () {},
                              ),
                            ),
                          ),
                  ),
      ),
    );
  }
}
