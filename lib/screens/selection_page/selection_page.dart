import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_signin_ui/blocs/auth_blocs/auth_bloc.dart';
import 'package:login_signin_ui/models/service_model.dart';
import 'package:login_signin_ui/screens/selection_page/service_detail.dart';
import 'package:login_signin_ui/screens/welcomes/welcome_screen.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:
            const Text('CLEAN MAID SERVICES', style: TextStyle(fontSize: 25)),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              icon: const Icon(Icons.login_outlined),
              onPressed: () {
                logoutDialog(context, authBloc);
              }),
        ],
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is SignOutSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.message), backgroundColor: Colors.green));
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => BlocProvider.value(
                          value: authBloc,
                          child: const WelcomeScreen(),
                        )),
                (route) => true);
          }
        },
        child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.all(2),
                  child: Card(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                ServiceModel serviceModel = ServiceModel(
                                  id: 1,
                                  name: 'Swipping Service',
                                  description:
                                      'Full house swiping service by our experienced cleaners',
                                  price: 50,
                                );
                                return ServiceDetail(
                                    serviceModel: serviceModel);
                              }));
                            },
                            child: Image.asset(
                                "assets/images/selection_page/Swipe.jpg",
                                fit: BoxFit
                                    .cover, // this is the solution for border
                                width: 110.0,
                                height: 110.0)),
                        Expanded(
                            child: Container(
                                padding: const EdgeInsets.all(5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const <Widget>[
                                    Text("SWIPPING SERVICE",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.blueAccent,
                                        ),
                                        textAlign: TextAlign.center),
                                    Text(
                                        "Description: Full house swiping service by our experienced housekeepers",
                                        textAlign: TextAlign.left),
                                    Text("Price: RM50/hr",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                )))
                      ]))),
              Container(
                  padding: const EdgeInsets.all(2),
                  child: Card(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                ServiceModel serviceModel = ServiceModel(
                                  id: 2,
                                  name: 'Mopping Service',
                                  description:
                                      'Description: Full house mopping service by our finest housekeepers',
                                  price: 50,
                                );
                                return ServiceDetail(
                                    serviceModel: serviceModel);
                              }));
                            },
                            child: Image.asset(
                                "assets/images/selection_page/Mop.jpg",
                                fit: BoxFit
                                    .cover, // this is the solution for border
                                width: 110.0,
                                height: 110.0)),
                        Expanded(
                            child: Container(
                                padding: const EdgeInsets.all(5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const <Widget>[
                                    Text("MOPPING SERVICE",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.blueAccent,
                                        ),
                                        textAlign: TextAlign.center),
                                    Text(
                                        "Description: Full house mopping service by our finest housekeepers",
                                        textAlign: TextAlign.left),
                                    Text("Price: RM50/hr",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                )))
                      ]))),
              Container(
                  padding: const EdgeInsets.all(2),
                  child: Card(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                ServiceModel serviceModel = ServiceModel(
                                  id: 3,
                                  name: 'Vacuum Service',
                                  description:
                                      'Description: Full house vacuum service by our talented housekeepers',
                                  price: 75,
                                );
                                return ServiceDetail(
                                    serviceModel: serviceModel);
                              }));
                            },
                            child: Image.asset(
                                "assets/images/selection_page/vacuum.jpg",
                                fit: BoxFit
                                    .cover, // this is the solution for border
                                width: 110.0,
                                height: 110.0)),
                        Expanded(
                            child: Container(
                                padding: const EdgeInsets.all(5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const <Widget>[
                                    Text("VACUUM SERVICE",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.blueAccent,
                                        ),
                                        textAlign: TextAlign.center),
                                    Text(
                                        "Description: Full house vacuum service by our talented housekeepers",
                                        textAlign: TextAlign.left),
                                    Text("Price: RM75/hr",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                )))
                      ]))),
              Container(
                  padding: const EdgeInsets.all(2),
                  child: Card(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                ServiceModel serviceModel = ServiceModel(
                                  id: 4,
                                  name: 'Organising Service',
                                  description:
                                      'Description: Full house vacuum service by our talented housekeepers',
                                  price: 100,
                                );
                                return ServiceDetail(
                                    serviceModel: serviceModel);
                              }));
                            },
                            child: Image.asset(
                                "assets/images/selection_page/organizing.jpg",
                                fit: BoxFit
                                    .cover, // this is the solution for border
                                width: 110.0,
                                height: 110.0)),
                        Expanded(
                            child: Container(
                                padding: const EdgeInsets.all(5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const <Widget>[
                                    Text("ORGANISING SERVICE",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.blueAccent,
                                        ),
                                        textAlign: TextAlign.center),
                                    Text(
                                        "Description: Full house vacuum service by our talented housekeepers",
                                        textAlign: TextAlign.left),
                                    Text("Price: RM100/hr",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                )))
                      ]))),
              Container(
                  padding: const EdgeInsets.all(2),
                  child: Card(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                ServiceModel serviceModel = ServiceModel(
                                  id: 5,
                                  name: 'Sanitisation Service',
                                  description:
                                      'Description: Full house sanitisation service by our housekeepers',
                                  price: 100,
                                );
                                return ServiceDetail(
                                    serviceModel: serviceModel);
                              }));
                            },
                            child: Image.asset(
                                "assets/images/selection_page/sanitise.png",
                                fit: BoxFit
                                    .cover, // this is the solution for border
                                width: 110.0,
                                height: 110.0)),
                        Expanded(
                            child: Container(
                                padding: const EdgeInsets.all(5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const <Widget>[
                                    Text("SANITISATION SERVICE",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.blueAccent,
                                        ),
                                        textAlign: TextAlign.center),
                                    Text(
                                        "Description: Full house sanitisation service by our housekeepers",
                                        textAlign: TextAlign.left),
                                    Text("Price: RM100/hr",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                )))
                      ]))),
              Container(
                  padding: const EdgeInsets.all(2),
                  child: Card(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                ServiceModel serviceModel = ServiceModel(
                                  id: 6,
                                  name: 'Full Service',
                                  description:
                                      'Description: Full service by our talented housekeepers',
                                  price: 200,
                                );
                                return ServiceDetail(
                                    serviceModel: serviceModel);
                              }));
                            },
                            child: Image.asset(
                                "assets/images/selection_page/Full Set.jpg",
                                fit: BoxFit
                                    .cover, // this is the solution for border
                                width: 110.0,
                                height: 110.0)),
                        Expanded(
                            child: Container(
                                padding: const EdgeInsets.all(5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const <Widget>[
                                    Text("FULL SERVICE",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.blueAccent,
                                        ),
                                        textAlign: TextAlign.center),
                                    Text(
                                        "Description: Full service by our talented housekeepers",
                                        textAlign: TextAlign.left),
                                    Text("Price: RM200/hr",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                )))
                      ]))),
            ]),
      ),
    );
  }

  void logoutDialog(BuildContext context, AuthBloc authBloc) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () => Navigator.of(context).pop(),
    );
    Widget continueButton = TextButton(
      child: const Text("Logout"),
      onPressed: () {
        authBloc.add(SignOutUserEvent());
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Logout"),
      content: const Text(
          "Are you sure you want to logout? You will be redirected to the login page"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
