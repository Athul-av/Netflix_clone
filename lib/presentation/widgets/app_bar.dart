import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
        ),
        const Spacer(),
       const Icon(
               Icons.cast,
                color: kWhiteColor,
                 size: 28, 
                      ),
           const SizedBox(width: 10,), 
                const SizedBox(
                      height: 30,
                 width: 30,
                  child: Image(
             image: NetworkImage(
                      'https://i.pinimg.com/originals/0d/dc/ca/0ddccae723d85a703b798a5e682c23c1.png'),
                     ),
              ),  
            const SizedBox(width: 10,) 
      ],
    );
  }
}
