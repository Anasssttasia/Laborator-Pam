import 'package:flutter/material.dart';

void main() {
  runApp(CurrencyConverterApp());
}

class CurrencyConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Currency Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CurrencyConverter(),
    );
  }
}

class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  String? _selectedFromCurrency = 'USD';
  String? _selectedToCurrency = 'EUR';
  double _amount = 0;
  double _result = 0;

  final List<String> _currencies = ['USD', 'EUR', 'RON', 'GBP', 'JPY'];

  final Map<String, double> _exchangeRates = {
    'USD_EUR': 0.93,
    'USD_RON': 4.58,
    'USD_GBP': 0.78,
    'USD_JPY': 147.13,
    'EUR_USD': 1.08,
    'EUR_RON': 4.92,
    'EUR_GBP': 0.84,
    'EUR_JPY': 158.11,
    'RON_USD': 0.22,
    'RON_EUR': 0.20,
    'RON_GBP': 0.17,
    'RON_JPY': 32.12,
    'GBP_USD': 1.28,
    'GBP_EUR': 1.18,
    'GBP_RON': 5.83,
    'GBP_JPY': 188.21,
    'JPY_USD': 0.0068,
    'JPY_EUR': 0.0063,
    'JPY_RON': 0.031,
    'JPY_GBP': 0.0053,
  };

  void _convert() {
    String conversionKey = '${_selectedFromCurrency}_$_selectedToCurrency';
    double? rate = _exchangeRates[conversionKey];

    if (rate != null) {
      setState(() {
        _result = _amount * rate;
      });
    } else {
      setState(() {
        _result = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //title: Text('Currency Converter'),
          ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Currency Converter',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 30),
              Card(
                elevation: 8,
                shadowColor: Colors.blueAccent,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildCurrencyDropdown('From', _selectedFromCurrency!,
                              (String? newValue) {
                            setState(() {
                              _selectedFromCurrency = newValue;
                            });
                          }),
                          Icon(Icons.arrow_forward, color: Colors.blueAccent),
                          _buildCurrencyDropdown('To', _selectedToCurrency!,
                              (String? newValue) {
                            setState(() {
                              _selectedToCurrency = newValue;
                            });
                          }),
                        ],
                      ),
                      SizedBox(height: 20),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Amount in $_selectedFromCurrency',
                          prefixIcon: Icon(Icons.monetization_on),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            _amount = double.tryParse(value) ?? 0;
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _convert,
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                          textStyle: TextStyle(fontSize: 18),
                        ),
                        child: Text('Convert'),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Amount in $_selectedToCurrency',
                          prefixIcon: Icon(Icons.money),
                        ),
                        controller: TextEditingController(
                          text: _result.toStringAsFixed(2),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCurrencyDropdown(
      String label, String selectedCurrency, Function(String?) onChanged) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 18, color: Colors.blueAccent),
        ),
        Row(
          children: [
            CircleAvatar(
              backgroundImage:
                  AssetImage('assets/${selectedCurrency.toLowerCase()}.png'),
              radius: 20,
            ),
            SizedBox(width: 8),
            DropdownButton<String>(
              value: selectedCurrency,
              onChanged: onChanged,
              items: _currencies.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ],
    );
  }
}
