import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference productsReferences =
        FirebaseFirestore.instance.collection("products");
    return Scaffold(
      appBar: AppBar(
        title: Text("HOLA"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                productsReferences.get().then(
                  (value) {
                    QuerySnapshot productsCollection = value;
                    List<QueryDocumentSnapshot> docs = productsCollection.docs;
                    docs.forEach((element) {
                      print(element.data());
                    });
                  },
                );
              },
              child: Text("Traer data"),
            ),
            ElevatedButton(
              onPressed: () {
                productsReferences.add({
                  "marca": "puma",
                  "modelo": "Puma100air",
                  "precio": 230,
                });
              },
              child: Text("Insertar 1"),
            ),
            ElevatedButton(
              onPressed: () {
                productsReferences.doc("bividis").set({
                  "marca": "boston",
                  "modelo": "lino algodon",
                  "precio": 23,
                });
              },
              child: Text("Insertar 2"),
            ),
          ],
        ),
      ),
    );
  }
}
