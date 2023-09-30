import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiptime/tiptime_provider.dart';

class HomePage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tip Time'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Row(
              children: [
                Icon(Icons.room_service),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Cost of Service',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.dinner_dining),
                Text(
                  "How was the service?",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 20),
            ListTile(
              title: Text("Amazing 20%"),
              leading: Radio(
                value: 1,
                onChanged: (value) {
                  Provider.of<TipTimeProvider>(context, listen: false)
                      .setSelectedTip(value);
                },
                groupValue: Provider.of<TipTimeProvider>(context).selectedTip,
              ),
            ),
            ListTile(
              title: Text("Good 18%"),
              leading: Radio(
                value: 2,
                onChanged: (value) {
                  Provider.of<TipTimeProvider>(context, listen: false)
                      .setSelectedTip(value);
                },
                groupValue: Provider.of<TipTimeProvider>(context).selectedTip,
              ),
            ),
            ListTile(
              title: Text("Okay 15%"),
              leading: Radio(
                value: 3,
                onChanged: (value) {
                  Provider.of<TipTimeProvider>(context, listen: false)
                      .setSelectedTip(value);
                },
                groupValue: Provider.of<TipTimeProvider>(context).selectedTip,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.credit_card),
                Text("Round up tip"),
                Switch(
                  value: Provider.of<TipTimeProvider>(context).isRounded,
                  onChanged: (value) {
                    Provider.of<TipTimeProvider>(context, listen: false)
                        .setRounded(value);
                  },
                ),
              ],
            ),
            SizedBox(
              height: 50,
              width: 500,
              child: ElevatedButton(
                onPressed: () {
                  double? costOfService = double.tryParse(_controller.text);
                  if (costOfService != null) {
                    Provider.of<TipTimeProvider>(context, listen: false)
                        .calculateService(costOfService);
                  } else {
                    // Handle invalid input
                  }
                },
                child: Text('Calculate'),
              ),
            ),
            Consumer<TipTimeProvider>(
              builder: (context, provider, _) {
                return Text('Tip amount: ${provider.tipAmount}');
              },
            ),
            Consumer<TipTimeProvider>(
              builder: (context, provider, _) {
                return Text('Total: ${provider.calculateTotal()}');
              },
            ),
          ],
        ),
      ),
    );
  }
}
