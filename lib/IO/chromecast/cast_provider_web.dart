import 'dart:js' as js;

class ChromeCastAPI {
  void Function(String)? _appendMessage;
  void Function(bool)? _hasSession;

  set onAppendMessage( void Function(String) fun) {
    _appendMessage = fun;
    js.context.callMethod('setCallback4appendMessage',
      [js.allowInterop(fun)]
    );
  } 

  bool get isAvailable => js.context.callMethod('isAvailable');

  set onHasSession(void Function(bool) fun) {
    _hasSession = fun;
    js.context.callMethod('setCallbackHasSession',[js.allowInterop(fun)]);
  }

  void stopSession() {
    js.context.callMethod('stopApp');
  }

  void sendMessage(String msg) {
    js.context.callMethod('sendMessage',[msg]);
  } 
}
