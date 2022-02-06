import 'cast_provider_web.dart'; // TODO : Can use a dummy to switch amount platforms

class ChromeCastRepository {

final ChromeCastAPI api;

  ChromeCastRepository(this.api);

  set onAppendMessage( void Function(String) fun) {
    api.onAppendMessage = fun;
  }

  get isAvailable => api.isAvailable;

  set onHasSession(void Function(bool) fun) {
    api.onHasSession = fun;
  }

  void stopSession() {
    api.stopSession();
  }

  void sendMessage(String msg) {
    api.sendMessage(msg);
  }
}