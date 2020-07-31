import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey _widgetKey = GlobalKey(); //every widget has a key attribute,
  Size _widgetSize;
  double _widgetWidth;
  double _widgetHeight;
  Offset _widgetPosition;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((timeStamp) => getWidgetSize());
  }

/*
we have widget tree and render tree. widget tree is immutable and render true is mutable which mean we can change
  in render tree. but render tree is not visible. to access render tree we use context which connect widget tree
  and render tree.
  */
  void getWidgetSize() {
    RenderBox _widgetBox = _widgetKey.currentContext.findRenderObject();
    _widgetSize = _widgetBox.size;
    _widgetPosition = _widgetBox.localToGlobal(Offset.zero);
    _widgetWidth = _widgetSize.width; //to convert it int use round method.
    _widgetHeight = _widgetSize.height;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widget Size and positioning"),
      ),
      body: Center(
        key: _widgetKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "WELCOME ABU BAKAR",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 18.0,
                  color: Colors.black87),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Size - $_widgetSize",
              style:
                  TextStyle(fontWeight: FontWeight.w900, color: Colors.black87),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Positioning - $_widgetPosition",
              style:
                  TextStyle(fontWeight: FontWeight.w900, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
