import 'package:flutter/material.dart';

class beliproduk extends StatelessWidget {
  final String imagePath;
  final String namaproduk;
  final String harga;

  const beliproduk({
    Key? key,
    required this.imagePath,
    required this.namaproduk,
    required this.harga,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:const Color(0xFFA7414A),
        title: Text(' $namaproduk', style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color:Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.all(20.0),
            child: Center(
            child: Image.asset(imagePath, width: 150, height: 150),            
            ),
            ),
            const SizedBox(height: 20),
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$namaproduk',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 16.0,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.star),
                onPressed: () {
                },
                ) 
              ],
            ),
          ),
            const SizedBox(height: 10),
          Padding(padding: EdgeInsets.all(5.0),
          child: Container(
            padding:const EdgeInsets.all(5.0),
            child: const Text('Mainan ini adalah mainan populer yang dirancang untuk mengembangkan kreativitas dan imajinasi anak-anak. Terbuat dari bahan berkualitas, mainan ini tidak hanya menyenangkan, tetapi juga aman untuk dimainkan.Mainan ini mampu menarik perhatian dan membuat anak-anak betah bermain berlama-lama.', 
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 14),),
          ),
          ),
          const SizedBox(height: 10),
            Padding(padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
              'Price\n$harga',
              style: TextStyle(fontSize: 15),
            ),
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Pembelian berhasil!')),
                  );
                },
                child: const Text('Beli bang'),
              ),
              ],
            ),
            ),
          ],
        ),
      ),
    );
  }
}
