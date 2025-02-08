import 'package:flutter/material.dart';
import 'package:validade/src/ui/controllers/product_controller.dart';
import 'package:validade/src/ui/create_product_widget.dart';
import 'package:validade/src/ui/widgets/shop_form.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage>
    with TickerProviderStateMixin {
  ProductController controller = ProductController();
  final twoWeeks = 14;

  @override
  void initState() {
    controller.loadShops();
    controller.loadProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Controles de Estoque '),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Produtos',
              ),
              Tab(
                text: 'Lojas',
              ),
            ],
          ),
        ),
        body: ListenableBuilder(
          listenable: controller,
          builder: (context, _) {
            return TabBarView(
              children: [
                ListView.separated(
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
                ),
                ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: controller.shops.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                          '${controller.shops[index].name} - ${controller.shops[index].cep}'),
                      subtitle: Text(
                        'Endereco  ${controller.shops[index].address} ',
                      ),
                    );
                  },
                ),
              ],
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
                  return ShopFormWidget(
                    onSave: (product) {
                      controller.createShop(product);
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
      ),
    );
  }
}
