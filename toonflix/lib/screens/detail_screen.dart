import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,

        surfaceTintColor: Colors.white,
        foregroundColor: Colors.green,

        centerTitle: true,
        title: const Text(
          "웹툰",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),

        elevation: 1,
        shadowColor: Colors.black,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: id,
                child: Container(
                  width: 220,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 15,
                        offset: const Offset(10, 15),
                        color: Colors.black.withValues(alpha: 0.5),
                      ),
                    ],
                  ),
                  child: Image.network(
                    headers: const {
                      "Referer": "https://comic.naver.com",
                    },
                    thumb,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
