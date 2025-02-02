import 'package:flutter/material.dart';
import 'package:validade/src/controllers/product_controller.dart';
import 'package:validade/src/ui/create_product_widget.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  ProductController controller = ProductController();
  final twoWeeks = 14;

  @override
  void initState() {
    controller.loadProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos Registrados'),
      ),
      body: ListenableBuilder(
        listenable: controller,
        builder: (context, _) {
          return ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            itemCount: controller.products.length,
            itemBuilder: (context, index) {
              return Container(
                color: controller.products[index].color,
                child: ListTile(
                  title: Text(
                      '${controller.products[index].name} - ${controller.products[index].lote}'),
                  subtitle: Text(
                    'Válido apenas em  ${controller.products[index].validateInDays()} dias',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: Container(
        padding: const EdgeInsets.all(10),
        width: 150,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(50),
        ),
        child: InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return CreateProductModal(
                  onSave: (product) {
                    controller.createProduct(product);
                    Navigator.pop(context);
                  },
                );
              },
            );
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Novo Produto'),
              SizedBox(width: 10),
              Icon(Icons.add),
            ],
          ),
        ),
      ),
    );
  }
}
