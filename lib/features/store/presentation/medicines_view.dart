import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skin_dd/features/store/presentation/product_details_view.dart';

import '../data/medicines_api.dart';

class medicinesview extends StatefulWidget {
  const medicinesview({super.key});

  @override
  State<medicinesview> createState() => _medicinesviewState();
}

class _medicinesviewState extends State<medicinesview> {
  late Future<List<Medicine>> futureMedicines;

  @override
  void initState() {
    super.initState();
    futureMedicines = MedicinesApi().fetchMedicines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Medicines'),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<Medicine>>(
          future: futureMedicines,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error loading medicines'));
            }
            else {
              final medicines = snapshot.data!;
              return GridView.builder(
                padding: EdgeInsets.all(5),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 items per row
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.75, // Adjust height vs width
                ),
                itemCount: medicines.length,
                // 4 cards
                itemBuilder: (context, index) {
                  final med = medicines[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 12,
                          spreadRadius: 2,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text('${med.name}',
                                    style: TextStyle(fontSize: 17),
                                    textAlign: TextAlign.left,),
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            Expanded(
                              child: Image.network(
                                med.imageUrl,
                                fit: BoxFit.cover,
                                loadingBuilder: (context, child, loadingProgress) {
                                  if (loadingProgress == null) {
                                    // Image has finished loading
                                    return child;
                                  } else {
                                    // Display a CircularProgressIndicator while loading
                                    return Center(
                                        child: CircularProgressIndicator()
                                    );
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              width: double.infinity,
                              child: MaterialButton(
                                padding: EdgeInsets.zero,
                                color: Colors.blue,
                                child: Text('Details',
                                    style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                  showModalBottomSheet(
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(25.0),
                                          topRight: Radius.circular(25.0),
                                        ),
                                      ),
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          height: MediaQuery
                                              .of(context)
                                              .size
                                              .height / 1.3,
                                          child: productdetailsview(medicine_data: med,),
                                        );
                                      }
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
