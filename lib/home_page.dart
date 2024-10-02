import 'package:flutter/material.dart';
import 'package:onlineshop/beli_produk.dart';
import 'package:onlineshop/profile_page.dart';

class Homepage extends StatefulWidget {
  final String username;
  const Homepage({super.key, required this.username});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFA7414A),
        title: const Text("Toy Store", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.person, color: Color.fromARGB(255, 255, 255, 255)),
            onPressed: () {
              Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilePage(
          username: widget.username,
        ),
      ),

                    );
            },
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 150,
            child: _listview(),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Welcome, ${widget.username}",
              style: const TextStyle(fontSize: 18),
            ),
          ),
          Expanded(
            child: _grid(),
          ),
        ],
      ),
    );
  }

  Widget _listview() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Container(
          width: 200.0,
          height: 100.0,
          padding: const EdgeInsets.all(10.0),
          color: const Color.fromARGB(255, 77, 116, 148),
          margin: const EdgeInsets.only(right: 20),
          child: Center(
            child: Image.asset('mobil.jpeg'),
          ),
        ),
        Container(
          width: 200.0,
          height: 100.0,
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.only(right: 20),
          color: const Color.fromARGB(255, 77, 116, 148),
          child: Center(
            child: Image.asset('motor.jpeg'),
          ),
        ),
        Container(
          width: 200.0,
          height: 100.0,
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.only(right: 20),
          color: const Color.fromARGB(255, 77, 116, 148),
          child: Center(
            child: Image.asset('kaktus.jpeg'),
          ),
        ),
        Container(
          width: 200.0,
          height: 100.0,
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.only(right: 20),
          color: const Color.fromARGB(255, 77, 116, 148),
          child: Center(
            child: Image.asset('boneka.jpeg'),
          ),
        ),
      ],
    );
  }

  Widget _grid() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 3 / 4,
      ),
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return _buildGridItem(
              imagePath: 'assets/motor.jpeg',
              color: Colors.blueAccent,
              text: 'Motor Vesmet 2030',
              harga: 'Harga : Rp41.000.000');
        } else if (index == 1) {
          return _buildGridItem(
              imagePath: 'assets/mobil.jpeg',
              color: Colors.greenAccent,
              text: 'Honda Civic Turbo 2040',
              harga: 'Harga : Rp483.369.500');
        } else if (index == 2) {
          return _buildGridItem(
              imagePath: 'assets/boneka.jpeg',
              color: Colors.redAccent,
              text: 'Freddy at night 4',
              harga: 'Harga : Rp150.000');
        } else {
          return _buildGridItem(
              imagePath: 'assets/kaktus.jpeg',
              color: Colors.orangeAccent,
              text: 'Kaktus',
              harga: 'Harga : Rp200.000');
        }
      },
    );
  }

  Widget _buildGridItem({
    required String imagePath,
    required Color color,
    required String text,
    required String harga,
  }) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                right: 20.0, left: 20.0, top: 10.0, bottom: 70.0),
            child: Center(
              child: Image.asset(
                imagePath,
                width: 100.0,
                height: 100.0,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15.0,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  harga,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => beliproduk(
                          imagePath: imagePath,
                          namaproduk: text,
                          harga: harga,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Beli'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
