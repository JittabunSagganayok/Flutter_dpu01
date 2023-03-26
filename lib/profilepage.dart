import 'package:flutter/material.dart';
import 'package:my_profile01/mystarrating.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});
  final url =
      "https://m.media-amazon.com/images/M/MV5BYTc3ZTc5MzItYWIzNS00ZmQ5LWI4NTctMjVmYmM2MTE0ODhiXkEyXkFqcGdeQXVyNjc3OTE4Nzk@._V1_.jpg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Transform.scale(
            scale: 1.5,
            child: Transform.translate(
              offset: Offset(0, 20),
              child: Image.network(
                "https://timelinecovers.pro/facebook-cover/download/anime-my-hero-academia-the-villains-vs-the-heroes-facebook-cover.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(0, 120),
            child: Column(
              children: [
                _buildProfileImage(),
                _buildProfileDetails(),
                _buildProfileActions(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildProfileImage() => Container(
        width: 180,
        height: 180,
        child: ClipOval(
          child: Image.network(
            url,
            fit: BoxFit.cover,
          ),
        ),
      );
  Widget _buildProfileDetails() => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              "Toshinori Yagi",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            MyStarRating(
              value: 5,
              // color: Colors.yellow,
              // starSize: 50,
            ),
            SizedBox(
              height: 10,
            ),
            _buildDetailRow('Nickname', 'AllMight'),
            _buildDetailRow('Age', '99'),
            _buildDetailRow('Power', 'One For All'),
          ],
        ),
      );

  Widget _buildDetailRow(String head, String value) {
    return Row(
      children: [
        Text(
          '$head: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text('$value'),
      ],
    );
  }

  Widget _buildProfileActions() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildActionIcon(Icons.restaurant, "Eat"),
          _buildActionIcon(Icons.favorite, "Love"),
          _buildActionIcon(Icons.directions_walk, "Exercise"),
        ],
      );

  Padding _buildActionIcon(IconData icon, String des) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Icon((icon)),
          Text("$des"),
        ],
      ),
    );
  }
}





// class buildProfileImage extends StatelessWidget {
//   const buildProfileImage({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Text("data");
//   }
// }
