import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'unit.dart';



/// [Converter screen]
class ConverterRoute extends StatefulWidget {

  final Color color;  // Color for [Category].
  final List<Unit> units;  // Units for [Category].
  /// [ConverterRoute] requires the color and units to not be null.
  // ConverterRoute(
  const ConverterRoute(
    { @required this.color, @required this.units, }
  ) : assert(color != null),
      assert(units != null);
  @override
  _ConverterRouteState createState() => _ConverterRouteState();
}



class _ConverterRouteState extends State<ConverterRoute> {

  /// [build()]+++++++++++++++++++++++++++++++++++++++++++++++++
  @override
  Widget build(BuildContext context) {
    // Here is just a placeholder for a list of mock units
    /// [Once the build() function is inside the State object,]
    /// [you'll have to reference this using `widget. units`]
    // final units = widget.units;
    // final color = widget.color;
    /// statefull、親widgetでfinal定義->state、継承した子widgetでは、[widget.variable]で十分

    // final unitWidgets = units.map((Unit unit) {
    final unitWidgets = widget.units.map((Unit unit) {
      return Container(
        // color: color,
        color: widget.color,
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              unit.name,
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              'Conversion: ${unit.conversion}',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
      );
    }).toList();

    return ListView(
      children: unitWidgets,
    );
  }
}
