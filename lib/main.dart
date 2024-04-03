import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pos_test/item_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade400),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Pos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController searchController = TextEditingController();
  Set<String> uniqueIds = items.map((item) => item.id).toSet();
  String itemcode = "";
  String? selectedItem;
  Item? selectedItemDetails;
  List<Item> selectedItems = [];
  List<Item> selectedItems2 = [];
  List<Item> updatedItem = [];
  List<String?> dropdownValues = [];

  findItemDetails(String itemcode) {
    for (int i = 0; i < items.length; i++) {
      if (items[i].id == itemcode) {
        selectedItems2.add(Item(
          id: items[i].id,
          product: items[i].product,
          quantity: items[i].quantity,
          pricePerUnit: items[i].pricePerUnit,
          tax: items[i].tax,
          price: items[i].price,
        ));
        // });
        return updatedItem.add(items[i]);
      }
    }
    return null;
  }

  update(int ind, String code, String dropdownValue) {
    print(ind);
    print(code);
    selectedItems2.removeAt(ind);
    for (int i = 0; i < items.length; i++) {
      if (items[i].id == code) {
        // setState(() {
        //   print(selectedItems2[i]);
        selectedItems2.insert(
            ind,
            Item(
              id: items[i].id,
              product: items[i].product,
              quantity: items[i].quantity,
              pricePerUnit: items[i].pricePerUnit,
              tax: items[i].tax,
              price: items[i].price,
              dropdown: dropdownValue,
            ));

        return items[i];
      }
    }
  }

  @override
  void initState() {
    super.initState();
    if (items.isNotEmpty) {
      dropdownValues = List.generate(
        selectedItems2.length,
        (index) => null,
      );
      // dropdownValue = items[0].id;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onEditingComplete: () {
                setState(() {
                  if (searchController.text.isNotEmpty) {
                    findItemDetails(searchController.text);
                  } else {
                    log("AAAAA");
                  }
                  //   //   id: itemcode,
                  //   //   product: '',
                  //   //   quantity: '',
                  //   //   pricePerUnit: 0,
                  //   //   tax: 0,
                  //   //   price: '',
                  //   // ));
                  // }
                });
              },
              controller: searchController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your Item code',
              ),
              // onChanged: (value) {
              //   setState(() {
              //     selectedItem = value;
              //     // Call findItemDetails to update selectedItemDetails
              //     selectedItemDetails = findItemDetails(selectedItem!);
              //   });
              // },
            ),
          ),
          const SizedBox(height: 5),
          if (selectedItem != null && selectedItemDetails != null)
            const Text(
              'Item Details:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
                itemCount: selectedItems2.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Item code :",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    selectedItems2[index].id,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  const SizedBox(width: 60),
                                  DropdownButton<String>(
                                    value: selectedItems2[index].dropdown,
                                    icon: const Icon(Icons.arrow_drop_down),
                                    hint: const Text('Select code'),
                                    elevation: 16,
                                    style: const TextStyle(color: Colors.black),
                                    underline: Container(
                                      height: 2,
                                      color: Colors.black,
                                    ),
                                    items: uniqueIds
                                        .where((id) => id.isNotEmpty)
                                        .toSet()
                                        .map<DropdownMenuItem<String>>((item) {
                                      return DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(item),
                                      );
                                    }).toList(),
                                    onChanged: (String? value) {
                                     
                                      selectedItems2[index].dropdown = value;
                                      
                                      setState(() {
                                        selectedItems2[index].id =
                                            value.toString();
                                        // dropdownValues[index] = value;
                                        selectedItem = value;
                                        update(index, selectedItem!, value!);
                                      });
                                    },
                                  )
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Product",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    selectedItems2[index].product,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Qty",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    selectedItems2[index].quantity,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Discount",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    selectedItems2[index]
                                        .pricePerUnit
                                        .toString(),
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Tax",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    selectedItems2[index].tax.toString(),
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Price",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    selectedItems2[index].price,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 10),
                            ],
                          ),
                          const Divider(color: Colors.black),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
