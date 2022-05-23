import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flytest/Model.dart';
import 'package:flytest/conversion.dart';
import 'package:provider/src/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Future.microtask(() => context.read<FetchDataProvider>());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final postData = context.watch<FetchDataProvider>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Kanguroo"),
        backgroundColor: Colors.green[300],
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10, bottom: 10),
            child: Text("Recommended",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          Container(
            height: 250,
            width: double.infinity,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: 5,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return RecomendedCard(
                  samplePost: postData.postData?.sample?[index],
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10, bottom: 10),
            child: Text("Top Developers",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          Container(
            height: 160,
            width: double.infinity,
            child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return DevelopersCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DevelopersCard extends StatelessWidget {
  DevelopersCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      width: 140,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: 140,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://www.track2realty.track2media.com/wp-content/uploads/2011/04/ats-paradiso.jpg"))),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Positioned(
                  bottom: 1,
                  child: Container(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        " Properties",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                Positioned(
                  bottom: 15,
                  child: Container(
                      padding: EdgeInsets.only(left: 15, bottom: 10),
                      child: Text(
                        "0",
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "jack",
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
                SizedBox(
                  height: 1,
                ),
                Text(
                  "year estb.",
                  style: TextStyle(color: Colors.black, fontSize: 10),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RecomendedCard extends StatelessWidget {
  final Sample? samplePost;
  RecomendedCard({
    Key? key,
    this.samplePost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
      child: Column(
        children: [
          Container(
            height: 120,
            width: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(samplePost?.image ??
                        "https://www.track2realty.track2media.com/wp-content/uploads/2011/04/ats-paradiso.jpg"))),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned(
                  bottom: 10,
                  child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        samplePost?.location ?? " Av. post names",
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Deve n ",
                  style: TextStyle(color: Colors.greenAccent),
                ),
                Text(
                  "Buy",
                ),
              ],
            ),
          ),
          Container(
            width: 200,
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    samplePost?.bedrooms ?? "2BD/1BD 2 Bedrroms",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Cima Park",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  Text("""💲 ${samplePost?.cost ?? "3M"}""")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
