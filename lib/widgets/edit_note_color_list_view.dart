import 'package:flutter/material.dart';
import 'package:note_app/constants/constants.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/custom_color_item.dart';

class EditColorListView extends StatefulWidget {
  const EditColorListView({super.key, required this.noteModel});
  final NoteModel noteModel;
  @override
  State<EditColorListView> createState() => _EditColorListViewState();
}

class _EditColorListViewState extends State<EditColorListView> {
  late int currentIndex;
  @override
  void initState() {
    currentIndex = kColorsList.indexOf(Color(widget.noteModel.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            currentIndex = index;
            widget.noteModel.color = kColorsList[index].value;

            setState(() {});
          },
          child: ColorItem(
            activatedColor: currentIndex == index,
            backgroundColor: kColorsList[index],
          ),
        ),
        itemCount: kColorsList.length,
      ),
    );
  }
}
