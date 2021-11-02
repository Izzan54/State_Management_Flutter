import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:text_user/main.dart';
import 'package:text_user/textstate.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';


// import 'dart:async';

// class TextBloc {
//   final _textController = StreamController<String>();
//   Stream<String> get textStream => _textController.stream;
//   //StreamSink<String> get textSink => _textController.sink;

//   dispose() {
//     _textController.close();
//   }

//   updateText(String text) {
//     // ignore: unnecessary_null_comparison
//     (text != null);
//     _textController.sink;
//   }
// }

class TextBloc {
  final _textController = StreamController<String>();
  Stream<String> get textStream => _textController.stream;
  //StreamSink<String> get textSink => _textController.sink;

  dispose() {
    _textController.close();
  }

  updateText(String text) {
    // ignore: unnecessary_null_comparison
    if (text != null) {
      _textController.sink.add(text);
    }
  }
}
