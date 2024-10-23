import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubit/add_note_cubit/add_cubit.dart';
import 'package:note_app/widgets/custom_color_item.dart';

class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int currentIndex = 0;
  List<Color> colorsList = const [
    Color(0xffBAB700),
    Color(0xffFB4D3D),
    Color(0xff60935D),
    Color(0xffFF579F),
    Color(0xff03CEA4),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            currentIndex = index;
            BlocProvider.of<AddNoteCubit>(context).color = colorsList[index];
            setState(() {});
          },
          child: ColorItem(
            activatedColor: currentIndex == index,
            backgroundColor: colorsList[index],
          ),
        ),
        itemCount: colorsList.length,
      ),
    );
  }
}
