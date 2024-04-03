class Item {
  String id;
  final String product;
  final String quantity;
  final double pricePerUnit;
  final double tax;
  final String price;
  String selectedItemCode;
  String? dropdown;

  Item({
     this.dropdown,
    required this.id,
    required this.product,
    required this.quantity,
    required this.pricePerUnit,
    required this.tax,
    required this.price,
    this.selectedItemCode = '',
  });
}

List<Item> items = [
  Item(
    id: "1001",
    product: "DELUXE BED",
    quantity: "24",
    pricePerUnit: 10.0,
    tax: 18.0,
    price: "27,000.00",
  ),
  Item(
    id: "1002",
    product: "COMFY SOFA",
    quantity: "36",
    pricePerUnit: 12.0,
    tax: 24.0,
    price: "35,500.00",
  ),
  Item(
    id: "1003",
    product: "STYLISH ARMCHAIR",
    quantity: "18",
    pricePerUnit: 8.0,
    tax: 16.0,
    price: "19,800.00",
  ),
  Item(
    id: "1004",
    product: "ELEGANT DINING TABLE",
    quantity: "30",
    pricePerUnit: 10.0,
    tax: 30.0,
    price: "42,000.00",
  ),
  Item(
    id: "1005",
    product: "MODERN TV STAND",
    quantity: "20",
    pricePerUnit: 8.0,
    tax: 20.0,
    price: "28,500.00",
  ),
  Item(
    id: "1006",
    product: "LUXURY COFFEE TABLE",
    quantity: "15",
    pricePerUnit: 5.0,
    tax: 10.0,
    price: "16,900.00",
  ),
  Item(
    id: "1007",
    product: "CHIC BOOKSHELF",
    quantity: "25",
    pricePerUnit: 5.0,
    tax: 20.0,
    price: "22,500.00",
  ),
  Item(
    id: "1008",
    product: "SLEEK SIDE TABLE",
    quantity: "12",
    pricePerUnit: 3.0,
    tax: 6.0,
    price: "9,500.00",
  ),
  Item(
    id: "1009",
    product: "COZY RUG",
    quantity: "40",
    pricePerUnit: 20.0,
    tax: 30.0,
    price: "29,999.00",
  ),
  Item(
    id: "1010",
    product: "ORNATE LAMP",
    quantity: "28",
    pricePerUnit: 15.0,
    tax: 20.0,
    price: "25,700.00",
  ),
];
