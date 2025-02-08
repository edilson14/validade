import 'package:flutter/material.dart';
import 'package:validade/src/domain/dto/shop_parans.dart';
import 'package:validade/src/domain/validators/shop_parans_validator.dart';

class ShopFormWidget extends StatelessWidget {
  final shopParans = ShopParans.fromEmpty();

  final shopParansValidator = ShopParansValidator();
  final Function(ShopParans product) onSave;

  ShopFormWidget({super.key, required this.onSave});

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
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nome da Loja',
                  border: OutlineInputBorder(),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: shopParansValidator.byField(shopParans, 'name'),
                onChanged: shopParans.setName,
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Endereço',
                  border: OutlineInputBorder(),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: shopParansValidator.byField(shopParans, 'address'),
                onChanged: shopParans.setAddress,
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'CEP',
                  border: OutlineInputBorder(),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: shopParansValidator.byField(shopParans, 'cep'),
                onChanged: shopParans.setCep,
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
                        onSave(shopParans);
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
