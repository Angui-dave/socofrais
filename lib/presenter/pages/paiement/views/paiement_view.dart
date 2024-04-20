import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:socofrais/domain/entities/product.dart';

class PaymentView extends StatefulWidget {
  final List<Product> products;
  final double totalPrice;

  const PaymentView({
    Key? key,
    required this.products,
    required this.totalPrice,
  }) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentView> {
  final _formKey = GlobalKey<FormState>();
  final _cardNumberController = TextEditingController();
  final _expirationDateController = TextEditingController();
  final _cvvController = TextEditingController();

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expirationDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Paiement',
        style: TextStyle(
          color: Colors.black
        ),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Détails de la commande',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: widget.products.length,
                itemBuilder: (context, index) {
                  final product = widget.products[index];
                  return ListTile(
                    leading: Image.asset(product.image, height: 48),
                    title: Text(product.name),
                    subtitle: Text('${product.price} F'),
                  );
                },
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${widget.totalPrice} F',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Informations de paiement',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _cardNumberController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(16),
                      CardNumberInputFormatter(),
                    ],
                    decoration: const InputDecoration(
                      labelText: 'Numéro de carte',
                      prefixIcon: Icon(Icons.credit_card),
                    ),
                    validator: (value) {
                      if (value!.length != 19) {
                        return 'Numéro de carte invalide';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _expirationDateController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(4),
                            CardExpiryInputFormatter(),
                          ],
                          decoration: const InputDecoration(
                            labelText: 'Date d\'expiration',
                            prefixIcon: Icon(Icons.calendar_today),
                          ),
                          validator: (value) {
                            if (value!.length != 5) {
                              return 'Date d\'expiration invalide';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: _cvvController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(3),
                          ],
                          decoration: const InputDecoration(
                            labelText: 'CVV',
                            prefixIcon: Icon(Icons.lock),
                          ),
                          validator: (value) {
                            if (value!.length != 3) {
                              return 'CVV invalide';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Logique de paiement ici
                      }
                    },
                    child: const Text('Payer'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String inputData = newValue.text;
    StringBuffer newText = StringBuffer();
    int selectionIndex = newValue.selection.end;
    int usedSeparatorCount = 0;

    for (int i = 0; i < inputData.length; i++) {
      if (inputData[i] != ' ' &&
          (i == 4 || i == 8 || i == 12) &&
          (usedSeparatorCount == 0 || (usedSeparatorCount == 1 && i != 4) || (usedSeparatorCount == 2 && i != 8))) {
        newText.write(' '); // Ajout d'un séparateur
        usedSeparatorCount++;
      } else if (inputData[i] != ' ') {
        newText.write(inputData[i]);
      }

      if (i == selectionIndex - 1) {
        selectionIndex = newText.length;
      }
    }

    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}

class CardExpiryInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String inputData = newValue.text;
    StringBuffer newText = StringBuffer();
    int selectionIndex = newValue.selection.end;

    for (int i = 0; i < inputData.length; i++) {
      if (i == 2 && inputData.length > 2) {
        newText.write('/');
      } else {
        newText.write(inputData[i]);
      }

      if (i == selectionIndex - 1) {
        selectionIndex = newText.length;
      }
    }

    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}