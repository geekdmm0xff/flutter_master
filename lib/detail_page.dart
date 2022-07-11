import 'package:flutter/material.dart';
import './widget/app_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: <Widget>[
            Positioned(
                child: Container(
              height: 300,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('img/mountain.jpeg'),
                      fit: BoxFit.cover)),
            )),
            Positioned(
                top: 70,
                left: 20,
                right: 20,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                          onPressed: () => print('tap menu'),
                          icon: const Icon(
                            Icons.menu,
                            color: Colors.white,
                          )),
                      IconButton(
                          onPressed: () => print('tap more'),
                          icon: const Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          )),
                    ],
                  ),
                )),
            Positioned(
                top: 270,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 800,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: _buildContent(),
                ))
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                'Yosemite',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const Text(
                '\$ 123',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.location_on,
              ),
              const SizedBox(
                width: 5,
              ),
              Text('CNY, ChengDu')
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Wrap(
                children: List.generate(
                    5,
                    (index) => Icon(
                          Icons.star,
                          color:
                              index < gottenStars ? Colors.amber : Colors.grey,
                        )),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '(0, 4)',
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Peole',
            style: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Number of peole join in group',
            style: TextStyle(color: Colors.grey, fontSize: 18),
          ),
          SizedBox(
            height: 10,
          ),
          Wrap(
            children: List.generate(
                5,
                (index) => InkWell(
                      onTap: () {
                        setState(() => selectedIndex = index);
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        child: AppButton(
                          color: selectedIndex == index
                              ? Colors.white
                              : Colors.black,
                          background: selectedIndex == index
                              ? Colors.black
                              : Colors.grey[200]!,
                          border: selectedIndex == index
                              ? Colors.black
                              : Colors.grey[200]!,
                          size: 60,
                          text: '${index + 1}',
                        ),
                      ),
                    )),
          )
        ],
      ),
    );
  }

  Widget _builderHeader(BuildContext context) {
    return Container(
      child: Stack(
        children: [],
      ),
    );
  }
}
