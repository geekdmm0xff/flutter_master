import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late final TabController _controller = TabController(length: 3, vsync: this);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildNavBar(),
            const SizedBox(
              height: 30,
            ),
            _buildTitleLabel(),
            const SizedBox(
              height: 30,
            ),
            _buildTabBar(),
            _buildTabBarView(),
            SizedBox(
              height: 30,
            ),
            _buildSubTitleLabel(),
            SizedBox(
              height: 20,
            ),
            _buildExplores()
          ],
        ),
      ),
    );
  }

  /// 导航栏
  Widget _buildNavBar() {
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Icon(
            Icons.menu,
            size: 30,
          ),
          Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.grey.withOpacity(0.5),
              )),
        ],
      ),
    );
  }

  /// 标题
  Widget _buildTitleLabel() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: const Text(
        "Discover",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
  }

  /// TabBar
  Widget _buildTabBar() {
    final List<Tab> _tabs = ['Places', 'Inspiration', 'Emotions']
        .map((e) => Tab(
              text: e,
            ))
        .toList();
    return Container(
      child: Align(
        alignment: Alignment.centerLeft,
        child: TabBar(
          tabs: _tabs,
          controller: _controller,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          isScrollable: true,
          labelPadding: const EdgeInsets.only(left: 30, right: 0),
          indicatorSize: TabBarIndicatorSize.label,
          indicator: CircleTabIndicator(color: Colors.blueAccent, radius: 4),
        ),
      ),
    );
  }

  Widget _buildTabBarView() {
    return Container(
      padding: EdgeInsets.only(left: 30),
      height: 300,
      child: TabBarView(
        controller: _controller,
        children: [
          ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return _buildTabContent('img/mountain.jpeg');
            },
          ),
          Text('2'),
          Text('3'),
        ],
      ),
    );
  }

  Widget _buildTabContent(String url) {
    return Container(
      margin: EdgeInsets.only(right: 15, top: 10),
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(image: AssetImage(url), fit: BoxFit.cover)),
    );
  }

  Widget _buildSubTitleLabel() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Explore more',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(
            'See all',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          )
        ],
      ),
    );
  }

  Widget _buildExplores() {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(left: 30),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return _buildExploreCell();
        },
      ),
    );
  }

  Widget _buildExploreCell() {
    return Container(
      margin: const EdgeInsets.only(right: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                    image: AssetImage('img/mountain.jpeg'), fit: BoxFit.cover)),
          ),
          Container(
            child: Text('Swimming'),
          )
        ],
      ),
    );
  }
}

/// 自定义tab指示器
class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) =>
      _CirclePainer(color: color, radius: radius);
}

class _CirclePainer extends BoxPainter {
  final Color color;
  final double radius;

  _CirclePainer({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true; // 抗锯齿加速
    paint.strokeWidth = 3.0;
    final center = Offset(
        configuration.size!.width * 0.5 + 15 - radius * 0.5 + offset.dx,
        configuration.size!.height - radius);
    canvas.drawCircle(center, radius, paint);

    // final start = Offset(
    //     (configuration.size!.width + 20) * 0.5 - radius * 0.5 + offset.dx - 10,
    //     configuration.size!.height - radius);
    // final end = Offset(
    //     (configuration.size!.width * 0.5 + 20) - radius * 0.5 + offset.dx + 10,
    //     configuration.size!.height - radius);
    // canvas.drawLine(start, end, paint);
  }
}
