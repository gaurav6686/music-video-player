import 'package:flutter/material.dart';
import 'package:musicplayer/englishlist.dart';
import 'package:musicplayer/hindi.dart';
import 'package:musicplayer/punjabi.dart';
import 'package:musicplayer/videoslider.dart';
// import 'package:video_player/video_player.dart';
import 'boly.dart';
import 'marathiList.dart';
import 'video1.dart';


class songTypes extends StatefulWidget {
  const songTypes({Key? key}) : super(key: key);

  @override
  State<songTypes> createState() => _songTypesState();
}

class _songTypesState extends State<songTypes> {
  int currentIndex = 0;

  List<String> images = [
    "https://media.giphy.com/media/3EfgWHj0YIDrW/200.gif",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFe10jB7lJTa0VizZAdgWqL-Au-1kT1aR2KA&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjHXFDH2xQJ-lh1-jbodwlo6goRitm0BOBGA&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYRXSwWU2Jo_3owP_wsn0Wu64RBphT2qbXmg&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXoKTvk5DTpYF5JksKgGBvvo7dgq2542gmIg&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShoqkI7_CYuRRNeYEOwuzpkiWnXNS0j-F7ww&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSUAA68BhDE2w4q1BCgQf0LX60PJ9MM8cBNw&usqp=CAU",
  ];

  // @override
  // void initState() {
  //   super.initState();
  //   _controller = PageController(
  //     initialPage: currentPage,
  //   );
  //   _videoPlayerController = VideoPlayerController.network(
  //       videoUrls[currentPage]
  //   );
  //   _videoPlayerController.initialize().then((_) {
  //     setState(() {});
  //   });
  // }
  //
  // @override
  // void dispose() {
  //   _controller.dispose();
  //   _videoPlayerController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(218, 22, 21, 21),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(110), // here the desired height
          child: AppBar(
            centerTitle: true,
            title: const Text(
              'Welcome to Music Player \nChoose your category',
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1.2,
              ),
            ),

            flexibleSpace: Container(
              height: 200,
              width: double.infinity,
              // color: Colors.black,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.black,
                  Colors.black38,
                ]),
              ),
              child: Container(
                margin: const EdgeInsets.only(top:90),
                padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VideoSlider()));
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Video',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),),
                      Icon( Icons.double_arrow_outlined,color: Colors.black,size: 15, ),
                    ],
                  ),
                ),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const hindisongs()));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text('Offline',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),),
                        Icon( Icons.double_arrow_outlined,color: Colors.black,size: 15, ),
                      ],
                    ),
                  ),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const hindisongs()));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text('Movie',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),),
                        Icon( Icons.double_arrow_outlined,color: Colors.black,size: 15, ),
                      ],
                    ),
                  ),
                ],
              ),
            ), // ...
            ),
          )),


      body: Container(
        decoration: const BoxDecoration(
          // color: Colors.black,
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blueAccent, Colors.black]),
        ),
        child: Column(
          children: [
            // Row(
            //   children: [
            //     const Padding(padding: EdgeInsets.only(top: 5)),
            //     ElevatedButton(
            //       style: ElevatedButton.styleFrom(
            //         primary: Colors.white,
            //       ),
            //       onPressed: () {
            //         Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //                 builder: (context) => const hindisongs()));
            //       },
            //       child: Row(
            //         mainAxisSize: MainAxisSize.min,
            //         children: const [
            //           Text('Video',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 12),),
            //           Icon( Icons.double_arrow_outlined,color: Colors.black,size: 40, ),
            //         ],
            //       ),
            //     ),
            //   ],
            //
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.only(top: 20),
            //       child: Container(
            //         height: 50,
            //         width: 300,
            //         decoration: BoxDecoration(
            //           color: Colors.white,
            //             borderRadius: BorderRadius.circular(10),
            //             boxShadow: const [
            //               BoxShadow(color: Colors.white, spreadRadius: 3),
            //             ],
            //         ),
            //         child: InkWell(
            //           child: const Text('Play offline Songs',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            //
            //           onTap: (){
            //             Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                     builder: (context) => const hindisongs()));
            //           },
            //
            //         ),
            //       ),
            //     ),
            //     const Icon( Icons.double_arrow_outlined,color: Colors.blue, ),
            //   ],
            // ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(color: Colors.blue, spreadRadius: 5),
                      ]),
                  child: InkWell(
                    child: Image.network(
                      'https://tse1.explicit.bing.net/th?id=OIP.kLeeONPbjjeskvcSG-zQ3AHaHa&pid=Api&P=0',
                      fit: BoxFit.cover,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const bolyList()));
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(color: Colors.blue, spreadRadius: 5),
                      ]),
                  child: InkWell(
                    child: Image.network(
                      'https://tse4.mm.bing.net/th?id=OIP.Ih4-5xLA9Q3btrF8VjMsWAHaHa&pid=Api&P=0',
                      fit: BoxFit.cover,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const marathiList()));
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text(
                  "HINDI SONGS",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "MARATHI SONGS",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(color: Colors.blue, spreadRadius: 5),
                      ]),
                  child: InkWell(
                    child: Image.network(
                      'https://tse4.mm.bing.net/th?id=OIP.mj30tCQIHAt0MWEUIvJ_DQHaHa&pid=Api&P=0',
                      fit: BoxFit.cover,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const englishList()));
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(color: Colors.blue, spreadRadius: 5),
                      ]),
                  child: InkWell(
                    child: Image.network(
                      'https://tse3.explicit.bing.net/th?id=OIP.fDsT_OlIqpzXm2lyeb_t8gHaHa&pid=Api&P=0',
                      fit: BoxFit.cover,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const punjabiList()));
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text(
                  "ENGLISH SONGS",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "PUNJABI SONGS",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),

            SizedBox(
              height: 200,
              width: double.infinity,
              child: PageView.builder(onPageChanged: (index) {
                setState(() {
                  currentIndex = index % images.length;
                });
              }, itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: InkWell(
                      onTap: (){
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (context) => const vedioOne()));
                      },
                      child: Image.network(
                        images[index % images.length],
                        fit: BoxFit.cover,
                      ),
                    )

                  ),
                );
              }),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < images.length; i++)
                  buildIndicator(currentIndex == i),
              ],
            )
          ],
        ),
        // child: GridView.count(
        //   // color: Colors.transparent
        //   padding: const EdgeInsets.all(10),
        //   crossAxisCount: 2,
        //   children: <Widget>[
        //
        //     Card(
        //       color: Colors.white,
        //       margin: const EdgeInsets.only(
        //           top: 10, right: 10, bottom: 10, left: 10),
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(15),
        //       ),
        //       child: InkWell(
        //         onTap: () {
        //             Navigator.push(
        //                 context,
        //                 MaterialPageRoute(
        //                     builder: (context) => const hindisongs()));
        //         },
        //         splashColor: Colors.green,
        //         child: Column(
        //           mainAxisSize: MainAxisSize.min,
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             Image.asset(
        //               'assets/boly.png',
        //               fit: BoxFit.fill,
        //               height: 120,
        //               width: 120,
        //             ),
        //             const Text(
        //               "HINDI SONGS",
        //               style: TextStyle(
        //                 fontSize: 15,
        //                 fontWeight: FontWeight.bold,
        //                 color: Colors.black,
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //     Card(
        //       color: Colors.white,
        //       margin: const EdgeInsets.only(
        //           top: 10, right: 10, bottom: 10, left: 10),
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(15),
        //       ),
        //       child: InkWell(
        //         onTap: () {
        //           // Navigator.push(
        //           //     context,
        //           //     MaterialPageRoute(
        //           //         builder: (context) => marathilist()));
        //         },
        //         splashColor: Colors.green,
        //         child: Column(
        //           mainAxisSize: MainAxisSize.min,
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             Image.asset(
        //               'assets/mara.png',
        //               fit: BoxFit.fill,
        //               height: 120,
        //               width: 120,
        //             ),
        //             const Text(
        //               "MARATHI SONGS",
        //               style: TextStyle(
        //                 fontSize: 15,
        //                 fontWeight: FontWeight.bold,
        //                 color: Colors.black,
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //     Card(
        //       color: Colors.white,
        //       margin: const EdgeInsets.only(
        //           top: 10, right: 10, bottom: 10, left: 10),
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(15),
        //       ),
        //       child: InkWell(
        //         onTap: () {
        //           Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                   builder: (context) => const englishList()));
        //         },
        //         splashColor: Colors.green,
        //         child: Column(
        //           mainAxisSize: MainAxisSize.min,
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             Image.asset(
        //               'assets/eng.png',
        //               fit: BoxFit.fill,
        //               height: 120,
        //               width: 120,
        //             ),
        //             const Text(
        //               "ENGLISH SONGS",
        //               style: TextStyle(
        //                 fontSize: 15,
        //                 fontWeight: FontWeight.bold,
        //                 color: Colors.black,
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //     Card(
        //       color: Colors.white,
        //       margin: const EdgeInsets.only(
        //           top: 10, right: 10, bottom: 10, left: 10),
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(15),
        //       ),
        //       child: InkWell(
        //         onTap: () {},
        //         splashColor: Colors.green,
        //         child: Column(
        //           mainAxisSize: MainAxisSize.min,
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             Image.asset(
        //               'assets/pun.png',
        //               fit: BoxFit.fill,
        //               height: 120,
        //               width: 120,
        //             ),
        //             const Text(
        //               "PUNJABI SONGS",
        //               style: TextStyle(
        //                 fontSize: 15,
        //                 fontWeight: FontWeight.bold,
        //                 color: Colors.black,
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }

  Widget buildIndicator(bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Container(
        height: isSelected ? 12 : 10,
        width: isSelected ? 12 : 10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.blue : Colors.white,
        ),
      ),
    );
  }
}
