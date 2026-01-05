import 'package:covid_app/view/world_state.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatefulWidget {
  dynamic data;
  DetailsScreen({
    super.key,
    required this.data,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final sizeOfDevice = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.data["name"]!),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: sizeOfDevice.height * 0.1,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: sizeOfDevice.width * 0.02),
                child: Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: sizeOfDevice.height * 0.067),
                      child: Card(
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .06,
                            ),
                            ReusableRow(
                              title: 'Cases',
                              value: widget.data["totalCases"]!.toString(),
                            ),
                            ReusableRow(
                              title: 'Recovered',
                              value: widget.data["totalRecovered"]!.toString(),
                            ),
                            ReusableRow(
                              title: 'Critical',
                              value: widget.data["critical"]!.toString(),
                            ),
                            ReusableRow(
                              title: 'Deaths',
                              value: widget.data["totalDeaths"]!.toString(),
                            ),
                            ReusableRow(
                              title: 'Today Recovered',
                              value: widget.data["todayRecovered"]!.toString(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    /* This one is for country flag. */
                    CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          NetworkImage(widget.data["image"]!.toString()),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
