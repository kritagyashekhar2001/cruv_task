import 'package:another_flushbar/flushbar.dart';
import 'package:cruv_task/bloc/seats_finder_bloc.dart';
import 'package:cruv_task/components/seat.dart';
import 'package:cruv_task/components/seat_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatsPage extends StatefulWidget {
  const SeatsPage({super.key});

  @override
  State<SeatsPage> createState() => _SeatsPageState();
}

class _SeatsPageState extends State<SeatsPage> {
  late TextEditingController _textEditingController;
  late FocusNode focusNode;
  @override
  void initState() {
    focusNode = FocusNode();
    _textEditingController = TextEditingController();
    super.initState();
  }

  void _showFlushBar(context, {required String message}) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      margin: const EdgeInsets.all(10),
      backgroundColor: Colors.red,
      duration: const Duration(milliseconds: 1800),
      message: message,
      messageColor: Colors.white,
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Seat Finder",
          style: TextStyle(
            color: Colors.lightBlue,
            fontSize: height * 0.03,
          ),
        ),
      ),
      body: Column(children: [
        SeatNumberField(
          focusNode: focusNode,
          textEditingController: _textEditingController,
        ),
        SizedBox(height: height * 0.01),
        Expanded(
          child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: width / height / 0.3,
                crossAxisSpacing: height * 0.01,
                mainAxisSpacing: width * 0.05,
              ),
              itemCount: 40,
              itemBuilder: (BuildContext ctx, index) {
                return BlocConsumer<SeatsFinderBloc, SeatsFinderState>(
                  listener: (context, state) {
                    if (state is NumberOutOfRange) {
                      _showFlushBar(context, message: state.error);
                    }
                  },
                  builder: (context, state) {
                    if (state is NumberColored && state.index == index) {
                      return Seat(
                        boxColor: Colors.lightBlue,
                        index: index,
                        textColor: Colors.white,
                      );
                    }
                    return Seat(
                      boxColor: Colors.lightBlue.withOpacity(0.15),
                      index: index,
                      textColor: Colors.lightBlue,
                    );
                  },
                );
              }),
        ),
      ]),
    );
  }
}
