import 'package:flutter/material.dart';

class DetailPages extends StatefulWidget {
  const DetailPages({super.key});

  @override
  State<DetailPages> createState() => _DetailPagesState();
}

class _DetailPagesState extends State<DetailPages> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300,
          width: 400,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Container(
                height: 200,
                width: 330,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Text('Kucing Sigma', style: TextStyle(color: Colors.black)),
            ],
          ),
        ),
      ],
    );
  }
}
