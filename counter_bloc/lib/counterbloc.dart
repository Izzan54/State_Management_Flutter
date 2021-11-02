import 'dart:async';
//import 'dart:developer';

enum CounterEvent {
  Increment,
}

class CounterBloc {
  
  //streamcontroller for counter event and ini
  final _countereventController = StreamController<CounterEvent>();
  final _counterController = StreamController<int>();

  //get the data
  Stream<CounterEvent> get eventStream => _countereventController.stream;
  Sink<CounterEvent> get eventSink => _countereventController.sink;
  
  Stream<int> get counterStream => _counterController.stream;
  Sink<int> get counterSink => _counterController.sink;

  int _counter = 0;

  CounterBloc(){
  eventStream.listen((CounterEvent event) {

    if(event == CounterEvent.Increment) {
      ++ _counter;
      counterSink.add(_counter);
    }
  });
}

  void dispose() {}

  // void dispose() {
  //   _countereventController.close();
  //   _counterController.close();
  // }
}

