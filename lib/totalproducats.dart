import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'navbar.dart';

class TotalProducts extends StatefulWidget {
  const TotalProducts({super.key});

  @override
  State<TotalProducts> createState() => _TotalProductsState();
}

class _TotalProductsState extends State<TotalProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.black,
        toolbarHeight: 104,
        backgroundColor: Colors.blueGrey[800],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        title: const Text(
          "Total Products",
          style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: Colors.white),
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search products...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              onChanged: (value) {
                // Handle search logic here
              },
            ),
          ),
          Expanded(
            child: _buildFoodGrid(context),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodGrid(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(4),
      child: Column(
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
            ),
            itemCount: 20, // Adjust the itemCount based on your data
            itemBuilder: (context, index) {
              return index == 0
                  ? _buildAddNewItem(context)
                  : _buildFoodItem(
                      name: 'Item $index',
                      quantity: 'Quant-35',
                      imagePath:
                          'assets/food.png', // Replace with your image path
                    );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAddNewItem(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showAddNewItemPopup(context);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add,
                size: 50,
                color: Colors.blue,
              ),
              SizedBox(height: 8),
              Text(
                'Add New Item',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAddNewItemPopup(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController mrpController = TextEditingController();
    TextEditingController discountController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    String selectedCategory = 'Select Category';
    List<String> categories = [
      'Select Category',
      'Category A',
      'Category B',
      'Category C'
    ];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(
                'Add New Item',
                style: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
              ),
              backgroundColor: Color.fromARGB(255, 35, 35, 113),
              content: SingleChildScrollView(
                child: Container(
                  width: 343, // Width of the AlertDialog
                  height: 550,
                  // Height of the AlertDialog
                  child: Column(
                    children: [
                      Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.white,
                      ),
                      SizedBox(height: 16),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: IconButton(
                          icon: Icon(Icons.camera_alt),
                          onPressed: () async {
                            // Request camera permission
                            bool hasPermission =
                                await _requestCameraPermission();
                            if (hasPermission) {
                              // Implement image picker logic here
                              final pickedFile = await ImagePicker()
                                  .pickImage(source: ImageSource.camera);
                              if (pickedFile != null) {
                                // Handle the selected image
                              }
                            } else {
                              // Handle permission denied
                              print('Camera permission denied.');
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 16),
                      Container(
                        width: 342, // Width of the text fields
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: 'Name of the Item',
                            labelStyle: TextStyle(
                                color: Colors.white, fontFamily: 'Poppins'),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Container(
                        width: 342, // Width of the text fields
                        child: TextField(
                          controller: mrpController,
                          decoration: InputDecoration(
                            labelText: 'MRP of the Item',
                            labelStyle: TextStyle(
                                color: Colors.white, fontFamily: 'Poppins'),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Container(
                        width: 342, // Width of the text fields
                        child: TextField(
                          controller: discountController,
                          decoration: InputDecoration(
                            labelText: 'Discount for the Item',
                            labelStyle: TextStyle(
                                color: Colors.white, fontFamily: 'Poppins'),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Container(
                        width: 343,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 147, 146, 146)),
                            borderRadius: BorderRadius.circular(2)),
                        padding: EdgeInsets.only(left: 2),
                        child: DropdownButton<String>(
                          underline: Container(),
                          dropdownColor: Color.fromARGB(255, 14, 56, 147),
                          isExpanded: true,
                          icon: Icon(
                            Icons.arrow_drop_down_rounded,
                            color: Colors.white,
                          ),
                          value: selectedCategory,
                          items: categories.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,
                                  style: TextStyle(color: Colors.white)),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              selectedCategory = value!;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 25),
                      Container(
                        width: 342, // Width of the text fields
                        child: TextField(
                          controller: descriptionController,
                          decoration: InputDecoration(
                            labelText: 'Description',
                            labelStyle: TextStyle(
                                color: Colors.white, fontFamily: 'Poppins'),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    // Handle submit button tap
                    String itemName = nameController.text;
                    String mrp = mrpController.text;
                    String discount = discountController.text;
                    String description = descriptionController.text;

                    // Implement logic to save the data

                    Navigator.pop(context);
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(fontFamily: 'Poppins'),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<bool> _requestCameraPermission() async {
    // Implement permission request logic here (You can use a permission plugin)
    // For simplicity, return true in this example
    return true;
  }

  Widget _buildFoodItem({
    required String name,
    required String quantity,
    required String imagePath,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 4),
                    Text('$quantity'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}