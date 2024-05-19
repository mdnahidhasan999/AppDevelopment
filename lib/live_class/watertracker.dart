import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _glassContTEController =
      TextEditingController(text: '1');
  int count = 0;
  List<WaterConsume> waterConsumeList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    GestureDetector(
                      onTap: _addWaterConsume,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.amber, width: 8),
                            borderRadius: BorderRadius.circular(100)),
                        child: const Padding(
                          padding: EdgeInsets.all(24.0),
                          child: Column(
                            children: [
                              Icon(Icons.water_drop_outlined, size: 32),
                              Text('Tap Here')
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      width: 100,
                      child: TextField(
                        controller: _glassContTEController,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            labelText: 'No of Glass',
                            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'History',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Total: $count ',
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
              const Divider(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: waterConsumeList.length,
                    reverse: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                          title: Text(DateFormat.yMEd().add_jms().format(waterConsumeList[index].time)),
                          leading: CircleAvatar(
                            child: Text('${index + 1}'),
                          ),
                          trailing: Text(
                              waterConsumeList[index].glassCount.toString()));
                    }),
              )
            ],
          ),
        ));
  }

  void _addWaterConsume() {
    int glassCount = int.tryParse(_glassContTEController.text) ?? 1;
    WaterConsume waterConsume =
        WaterConsume(time: DateTime.now(), glassCount: glassCount);
    waterConsumeList.add(waterConsume);
    setState(() {});
  }
}

class WaterConsume {
  final DateTime time;
  final int glassCount;

  WaterConsume({required this.time, required this.glassCount});
}
