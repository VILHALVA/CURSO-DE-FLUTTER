import 'package:conversor/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class HomeController {
  late List<CurrencyModel> currencies;
  final TextEditingController toText;
  final TextEditingController fromText;
  late CurrencyModel toCurrency;
  late CurrencyModel fromCurrency;

  HomeController({required this.toText, required this.fromText}) {
    currencies = CurrencyModel.getCurrencies();
    toCurrency = currencies[0];
    fromCurrency = currencies[1];
  }

  void convert() {
    String text = toText.text;
    double value = double.tryParse(text.replaceAll(',', '.')) ?? 1.0;
    double convertedValue = 0;
    switch (fromCurrency.name) {
      case 'Real':
        convertedValue = value * toCurrency.real;
        break;
      case 'Dólar':
        convertedValue = value * toCurrency.dolar;
        break;
      case 'Euro':
        convertedValue = value * toCurrency.euro;
        break;
      case 'Bitcoin':
        convertedValue = value * toCurrency.bitcoin;
        break;
    }

    fromText.text = convertedValue.toStringAsFixed(2);
  }
}
