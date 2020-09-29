import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'converter_route.dart';
import 'unit.dart';

final _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);



/// custom [Category] widget.
class Category extends StatelessWidget {
  final String name;
  final ColorSwatch color;
  final IconData iconLocation;
  final List<Unit> units;

  const Category({ /// Creates a [Category] with assert
    Key key,
    @required this.name,
    @required this.color,
    @required this.iconLocation,
    @required this.units,
  })  : assert(name != null),
        assert(color != null),
        assert(iconLocation != null),
        assert(units != null),
        super(key: key);


  /// Navigates to the [ConverterRoute].
  void _navigateToConverter(BuildContext context) {  // from build() with context
    Navigator.of(context).push(MaterialPageRoute<Null>( // Navigator.push(c,r) vs Navigator.of(c).push(r)
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            elevation: 1.0,
            title: Text(
              name,
              style: Theme.of(context).textTheme.headline4,
            ),
            centerTitle: true,
            backgroundColor: color,
          ),
          body: ConverterRoute(
            color: color,
            units: units,
          ),
        );
      },
    ));
  }



  /// [build()]+++++++++++++++++++++++++++++++++++++++++++++++++++++++
  /// icon, name, and color for the [Category].
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: _rowHeight,
        child: InkWell( // InkWell
          borderRadius: _borderRadius,
          highlightColor: color,
          splashColor: color, // splash
          onTap: () => _navigateToConverter(context), // to _navigateToConverter() with context
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Icon(
                    iconLocation,
                    size: 60.0,
                  ),
                ),
                Center(
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
