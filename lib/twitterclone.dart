import 'package:flutter/material.dart';

class Twitter extends StatelessWidget {
  const Twitter({super.key});
  final urlprofile =
      "https://m.media-amazon.com/images/M/MV5BYTc3ZTc5MzItYWIzNS00ZmQ5LWI4NTctMjVmYmM2MTE0ODhiXkEyXkFqcGdeQXVyNjc3OTE4Nzk@._V1_.jpg";
  final urlcover =
      "https://timelinecovers.pro/facebook-cover/download/anime-my-hero-academia-the-villains-vs-the-heroes-facebook-cover.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Transform.scale(
            scale: 1,
            child: Transform.translate(
              offset: Offset(0, 0),
              child: Image.network(
                urlcover,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(0, 50),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    children: [
                      _buildbutton(Icons.arrow_back_rounded),
                      Expanded(
                          child: SizedBox()), //ใช้ spacebetween กับ row แทนได้
                      _buildbutton(Icons.search_rounded),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      _buildProfileImage(context),
                      Expanded(
                          child: SizedBox()), //ใช้ spacebetween กับ row แทนได้
                      Column(
                        //ใข้ mainaxisaligment.end กับ row ไม่ต้องใช้ column
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            //margin: const EdgeInsets.all(30.0),
                            padding: const EdgeInsets.all(10),
                            decoration:
                                myBoxDecoration(), //             <--- BoxDecoration here
                            child: Text(
                              "Edit profile",
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text("HMoo",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text("@hmoo3ton",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  ClipOval _buildbutton(IconData icon) {
    return ClipOval(
      child: Container(
        width: 35,
        height: 35,
        color: Colors.black.withOpacity(0.6),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImage(context) => Container(
        width: 80,
        height: 80,
        //ขอบจะใช้ container ซ้อน container ก้ได้
        decoration: BoxDecoration(
          border: Border.all(
            width: 5,
            color: Theme.of(context).primaryColor,
          ),
          borderRadius: BorderRadius.circular(100), //<-- SEE HERE
        ),
        child: ClipOval(
          child: Image.network(
            urlprofile,
            fit: BoxFit.cover,
          ),
        ),
      );

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(color: Colors.black.withOpacity(0.15), width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
    );
  }
}
