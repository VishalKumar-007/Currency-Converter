import 'package:flutter/cupertino.dart';

class CurrencyConverterCupertinoPage extends StatefulWidget {
  const CurrencyConverterCupertinoPage({super.key});

  @override
  State<CurrencyConverterCupertinoPage> createState() =>
      _CurrencyConverterCupertinoPageState();
}

class _CurrencyConverterCupertinoPageState
    extends State<CurrencyConverterCupertinoPage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  void convert() {
    result = double.parse(textEditingController.text) * 85;
    setState(() {});
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final border = BoxBorder.all(
      width: 2.0,
      style: BorderStyle.solid,
    );

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGrey,
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemGrey,
        middle: Text(
          'Currency Converter',
          style: TextStyle(
            color: CupertinoColors.white,
            fontSize: 22,
          ),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'INR ${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}',
              style: const TextStyle(
                fontSize: 55,
                fontWeight: FontWeight.bold,
                color: CupertinoColors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: CupertinoTextField(
                padding: const EdgeInsetsGeometry.all(10),
                controller: textEditingController,
                style: const TextStyle(
                  color: CupertinoColors.black,
                ),
                placeholder: "Please enter the amount in USD",
                placeholderStyle: const TextStyle(
                  color: CupertinoColors.black,
                ),
                prefix: const Icon(
                  CupertinoIcons.money_dollar,
                  color: CupertinoColors.black,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: CupertinoColors.white,
                  border: border,
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: CupertinoButton(
                onPressed: () {
                  convert();
                },
                foregroundColor: CupertinoColors.white,
                color: CupertinoColors.black,
                borderRadius: BorderRadius.circular(8),
                child: const Text(
                  "Convert",
                  style: TextStyle(
                    color: CupertinoColors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
