import 'package:ascension_mobile_app/presentation/widgets/custom_app_bar_and_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_switch/flutter_switch.dart';

class FilterScreen extends StatefulWidget {
  static const String route = 'filter-screen';

  FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  Color _colorContainer = Colors.grey;
  RangeValues _currentRangeValues = const RangeValues(0, 100000000);
  bool status = true;
  bool status1 = true;
  String dropdownvalue = 'Karachi';
  var cities = [
    "Karachi",
    "Lahore",
    "Faisalabad",
    "Rawalpindi",
    "Gujranwala",
    "Peshawar",
    "Multan",
    "Hyderabad",
    "Islamabad",
    "Quetta",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomAppBarAndBody(
        showBackButton: true,
        title: 'Filters',
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Price Range",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            RangeSlider(
              values: _currentRangeValues,
              max: 100000000,
              min: 0,
              divisions: 10,
              labels: RangeLabels(
                _currentRangeValues.start.round().toString(),
                _currentRangeValues.end.round().toString(),
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  _currentRangeValues = values;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("min: 0"),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text("Max: 100000000"),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Auctioned Businesses",
                      style: Theme.of(context).textTheme.headline6),
                  FlutterSwitch(
                    width: 50.0,
                    height: 30.0,
                    valueFontSize: 20.0,
                    toggleSize: 15.0,
                    value: status,
                    borderRadius: 30.0,
                    padding: 8.0,
                    // showOnOff: true,
                    onToggle: (val) {
                      setState(() {
                        status = val;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Established Businesses",
                      style: Theme.of(context).textTheme.headline6),
                  FlutterSwitch(
                    width: 50.0,
                    height: 30.0,
                    valueFontSize: 20.0,
                    toggleSize: 15.0,
                    value: status1,
                    borderRadius: 30.0,
                    padding: 8.0,
                    // showOnOff: true,
                    onToggle: (val) {
                      setState(() {
                        status1 = val;
                      });
                    },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Location",
                      style: Theme.of(context).textTheme.headline6),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 50,
                    child: DropdownButton(
                      value: dropdownvalue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: cities.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Industry:",
                  style: Theme.of(context).textTheme.headline6),
            ),
            Expanded(
              child: GridView.count(
                primary: false,
                // padding: const EdgeInsets.all(20),
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                crossAxisCount: 5,
                children: [
                  IndustryTag(industry: "Fashion"),
                  IndustryTag(industry: "Retail"),
                  IndustryTag(industry: "Factory"),
                  IndustryTag(industry: "Real State"),
                  IndustryTag(industry: "Logistics"),
                  IndustryTag(industry: "Food"),
                  IndustryTag(industry: "Sports"),
                  IndustryTag(industry: "Start Up"),
                  IndustryTag(industry: "Sports"),
                  IndustryTag(industry: "Start Up"),
                ],
              ),
            ),
            // SizedBox(
            //   height: 50,
            //   width: double.infinity,
            //   child: ListView(
            //     scrollDirection: Axis.horizontal,
            //     children: [

            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

class IndustryTag extends StatelessWidget {
  String industry;
  IndustryTag({required this.industry, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Container(
          height: 30,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Theme.of(context).colorScheme.secondaryContainer,
          ),
          child: Center(child: Text(industry)),
        ),
        // onTap: () {
        //   setState(() {
        //     _colorContainer = _colorContainer == Colors.blue
        //         ? Colors.grey
        //         : Colors.blue;
        //   });
        // },
      ),
    );
  }
}
