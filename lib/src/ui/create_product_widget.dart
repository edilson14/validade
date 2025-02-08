import 'package:flutter/material.dart';
import 'package:validade/src/domain/validators/product_params_validator.dart';

import '../domain/dto/product_params.dart';

class CreateProductModal extends StatelessWidget {
  final productParamns = ProductParams.fromEmpty();
  final _dateController = TextEditingController();

  final productParansValidator = ProductParamsValidator();

  final Function(ProductParams product) onSave;
  CreateProductModal({super.key, required this.onSave});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text('Novo Produto'),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator:
                    productParansValidator.byField(productParamns, 'name'),
                onChanged: productParamns.setName,
                decoration: const InputDecoration(
                  labelText: 'Nome do Produto',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: productParamns.setLote,
                validator:
                    productParansValidator.byField(productParamns, 'lote'),
                decoration: const InputDecoration(
                  labelText: 'Lote',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _dateController
                  ..text = productParamns.validade.toString().substring(0, 10),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    initialDate: DateTime.now().add(const Duration(days: 1)),
                    context: context,
                    firstDate: DateTime.now().add(
                      const Duration(days: 1),
                    ),
                    lastDate: DateTime.now().add(
                      const Duration(days: 600),
                    ),
                  );

                  if (pickedDate != null) {
                    _dateController.text =
                        pickedDate.toString().substring(0, 10);
                    productParamns.setValidade(pickedDate);
                  }
                },
                keyboardType: TextInputType.datetime,
                validator: productParansValidator.byField(
                  productParamns,
                  'validateDate',
                ),
                decoration: const InputDecoration(
                  labelText: 'Data de Validade',
                  border: OutlineInputBorder(),
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
                        onSave(productParamns);
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
