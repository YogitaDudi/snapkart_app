
import 'package:flutter/material.dart';
import 'package:snapkart/comman/storge_helper.dart';
import 'package:snapkart/model/product_model.dart';


class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  final StorageHelper storageHelper = StorageHelper();
  void _addProduct() async {
    String name = _nameController.text.trim();
    String description = _descriptionController.text.trim();
    String imageUrl = _imageUrlController.text.trim();
    double? price = double.tryParse(_priceController.text)?? 0.0;

    String id = DateTime.now().millisecondsSinceEpoch.toString();
    if (name.isNotEmpty && description.isNotEmpty && price > 0) {
      Product newProduct = Product(
        id: id,
        name: name,
        description: description,
        imageUrl: imageUrl,
        price: price.toString(),
      );
      List<Product> products = await StorageHelper.getProducts();
      products.add(newProduct);
      await StorageHelper.saveProducts(products);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Product added successfully!')),
      );
      _nameController.clear();
      _descriptionController.clear();
      _imageUrlController.clear();
      _priceController.clear();
    } else {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields and enter a valid price.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Product Name'),
              ),
              TextField(
                controller: _descriptionController,
                maxLength: 4,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              TextField(
                controller: _imageUrlController,
                decoration: const InputDecoration(labelText: 'Image URL (optional)'),
              ),
              TextField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Price'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addProduct,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen,
                ),
                child: const Text('Add Product'),
              ),
          
            ],
          ),
        ),
      ),
    );
  }
}