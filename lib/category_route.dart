import 'package:flutter/material.dart';
import 'category.dart';
import 'unit.dart';

final _backgroundColor = Colors.cyan[200];



/// Home screen: a list of [Categories].
/// [StatefulWidget]
class CategoryRoute extends StatefulWidget {
  // データ受け渡しクラス常備。statufulに記載。同class名。const有無は状況次第
  // CategoryRoute();
  const CategoryRoute();
  @override
  _CategoryRouteState createState() => _CategoryRouteState();
}



class _CategoryRouteState extends State<CategoryRoute> {

  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  ///  [stateオブジェクト内の、build()外で、変数定義を作成]to
  final _categories = <Category>[];  // state内かつbuild()外での定義ゆえ_private修正
  @override  // initState使うためセット
  void initState() {
    for (var i = 0; i < _categoryNames.length; i++) {  // 初期化したいのはfor文{}全体
      _categories.add(  /// [配列categories内に、name/color/icon/unitの配列を格納]
        Category(
          name: _categoryNames[i],  // key-value
          color: _baseColors[i],
          iconLocation: Icons.cake,
          units: _retrieveUnitList(_categoryNames[i]),  // unit -> conveter unit
        ),
      );
    }
  }



  /// [_buildCategoryWidgets()] correct number of rows for the list view.
  // Widget _buildCategoryWidgets(List<Widget> _categories) {  // 受け渡し同数。needed argument!!listをbuild()毎回更新するため引数で必要だった
  Widget _buildCategoryWidgets() {  // needless argument -> listnbuild()外で定義してinitState
    return ListView.builder(
      itemCount: _categories.length,
      itemBuilder: (BuildContext context, int index) => _categories[index],
    );
  }

  /// list [Unit]s.
  List<Unit> _retrieveUnitList(String categoryName) {
    return List.generate(10, (int i) {
      i += 1;
      return Unit(
        name: '$categoryName Unit $i',
        conversion: i.toDouble(),
      );
    });
  }


  /// [常にbuild()起点] +++++++++++++++++++++++++++++++++++++++++++
  @override
  Widget build(BuildContext context) {

    ///  [stateオブジェクト内の、build()外で、変数定義を作成]from
    /// build()内でcategory定義してi番つけてfor反復だと、[毎回build()呼び込む必要がある為]
    /// 外側で定義するので、[同時にinitState()]内で配列初期化
    /// categoriesは_buildCategoryWidgets()を通さなくてもよくなる
    // ```
    // final categories = <Category>[];
    // for (var i = 0; i < _categoryNames.length; i++) {
    //   categories.add(  /// [配列categories内に、name/color/icon/unitの配列を格納]
    //     Category(
    //       name: _categoryNames[i],  // key-value
    //       color: _baseColors[i],
    //       iconLocation: Icons.cake,
    //       units: _retrieveUnitList(_categoryNames[i]),  // unit -> conveter unit
    //     ),
    //   );
    // }
    // ```

    final listView = Container(
      color: _backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      // child: _buildCategoryWidgets(categories),  /// 外で変数定義しないならargument!!上で作った[categories]
      child: _buildCategoryWidgets(),
    );

    final appBar = AppBar(
      elevation: 2.0,
      title: Text(
        'Miss. Statuful',
        style: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
        ),
      ),
      centerTitle: true,
      backgroundColor: _backgroundColor,
    );

    /// [return AppBar and ListView] +++++++++++++++
    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }
}
