import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_geocoder/geocoder.dart';

class ConvertLangLong extends StatelessWidget {
  const ConvertLangLong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        ElevatedButton(
          onPressed: () async {
            final query = "1600 Amphiteatre Parkway, Mountain View";
            var addresses = await Geocoder.local.findAddressesFromQuery(query);
            var first = addresses.first;
            print("${first.featureName} : ${first.coordinates}");

            final coordinates = Coordinates(26.6646, 87.2718);
            var address =
                await Geocoder.local.findAddressesFromCoordinates(coordinates);
            print(first.countryCode);
            print(address.first.countryCode);
          },
          child: const Text("convert"),
        ),
      ],
    )));
  }
}
