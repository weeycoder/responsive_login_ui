import 'package:flutter/material.dart';
import 'package:login_signin_ui/models/service_model.dart';

class ServiceDetail extends StatelessWidget {
  const ServiceDetail({super.key, required this.serviceModel});
  final ServiceModel serviceModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(serviceModel.name?.toUpperCase() ?? ''),
          backgroundColor: Colors.blue,
          automaticallyImplyLeading: false, //get rid of back arrow
        ),
        body: Column(children: <Widget>[
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                border: Border.all(color: Colors.lightBlue)),
            child: Text(
                'This is ${serviceModel.name} page. We provide the best ${serviceModel.name} of all time',
                style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 10),
          Container(
              width: 100.0,
              height: 60,
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(children: <Widget>[
                OutlinedButton(
                    onPressed: () {},
                    child: const Text('BOOK',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                        textAlign: TextAlign.center)),
              ])),
          Container(
              width: 100.0,
              height: 60,
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(children: <Widget>[
                OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(' Back ',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                        textAlign: TextAlign.center))
              ]))
        ]));
  }
}
