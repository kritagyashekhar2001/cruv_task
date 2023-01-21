import 'package:cruv_task/bloc/seats_finder_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatNumberField extends StatelessWidget {
  const SeatNumberField({
    Key? key,
    required this.focusNode,
    required TextEditingController textEditingController,
  })  : _textEditingController = textEditingController,
        super(key: key);

  final FocusNode focusNode;
  final TextEditingController _textEditingController;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: height * 0.01, horizontal: width * 0.05),
      child: TextFormField(
        keyboardType: TextInputType.number,
        cursorHeight: height * 0.028,
        focusNode: focusNode,
        controller: _textEditingController,
        style: const TextStyle(
          fontFamily: "PJS",
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () {
              BlocProvider.of<SeatsFinderBloc>(context).add(NumberEntered(
                  int.tryParse(_textEditingController.text) ?? 0));
              FocusScope.of(context).unfocus();
            },
            child: Container(
              width: width * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width * 0.02),
                color: focusNode.hasFocus ? Colors.lightBlue : Colors.grey,
                border: Border.all(
                  color: focusNode.hasFocus ? Colors.lightBlue : Colors.grey,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                "Find",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "PJS",
                  fontSize: height * 0.018,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          isDense: true,
          hintStyle: TextStyle(
            fontFamily: "PJS",
            fontSize: height * 0.018,
            fontWeight: FontWeight.w500,
            color: Colors.lightBlue,
          ),
          hintText: "Enter Seat Number",
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.lightBlue),
            borderRadius: BorderRadius.all(
              Radius.circular(width * 0.02),
            ),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.lightBlue),
            borderRadius: BorderRadius.all(
              Radius.circular(width * 0.02),
            ),
          ),
        ),
      ),
    );
  }
}
