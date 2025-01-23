import 'package:flutter/material.dart';
import 'package:validade/src/models/product_model.dart';

class CreateProductModal extends StatelessWidget {
  var productModel = ProductModel();
  final ProductModelValidor productModelValidor = ProductModelValidor();

  final Function(ProductModel product) onSave;
  CreateProductModal({super.key, required this.onSave});

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text('Novo Produto'),
              TextFormField(
                validator: productModelValidor.byField(productModel, 'name'),
                onChanged: (value) {
                  productModel.name = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Nome do Produto',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                onChanged: (value) {
                  productModel.lote = value;
                },
                validator: productModelValidor.byField(productModel, 'lote'),
                decoration: const InputDecoration(
                  labelText: 'Lote',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.datetime,
                validator:
                    productModelValidor.byField(productModel, 'validateDate'),
                onChanged: (value) {
                  if (value.length == 10) {
                    value = value.replaceAll('/', '');
                    productModel.validateDate = DateTime.parse(value);
                  }
                },
                inputFormatters: const [],
                decoration: const InputDecoration(
                  labelText: 'Data de Validade',
                  border: OutlineInputBorder(),
                  hintText: 'yyyy/mm/dd',
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancelar'),
                  ),
                  const SizedBox(width: 40),
                  ElevatedButton(
                    onPressed: () {
                      if ((formKey.currentState?.validate() ?? false)) {
                        onSave(productModel);
                      }
                    },
                    child: const Text('Salvar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
