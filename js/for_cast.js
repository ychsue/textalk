/* This is modified from https://github.com/AVGP/CastHelloText-chrome */

var applicationID = '18E63561';
var namespace = 'urn:x-cast:io.github.ychsue.textalk';
var session = null;
var callback4appendMessage = null; //void Function(String)
var callbackHasSession = null; //void Function(bool)

/**
 * Call initialization for Cast
 */
if (!!window.chrome && (!chrome.cast || !chrome.cast.isAvailable)) {
    setTimeout(initializeCastApi, 1000);
}
  
/**
 * initialization (be called during launch time)
 */
 function initializeCastApi() {
    var sessionRequest = new chrome.cast.SessionRequest(applicationID);
    var apiConfig = new chrome.cast.ApiConfig(sessionRequest,
      sessionListener,
      receiverListener);
  
    chrome.cast.initialize(apiConfig, onInitSuccess, onError);
};

//#region initializeCastApi()
//#region initializeCastApi.sessionListener()
/**
 * session listener during initialization
 */
 function sessionListener(e) {
    appendMessage('New session ID:' + e.sessionId);
    if (!!callbackHasSession) callbackHasSession(true);
    session = e;
    session.addUpdateListener(sessionUpdateListener);  
    session.addMessageListener(namespace, receiverMessage);
}

/**
 * listener for session updates
 */
function sessionUpdateListener(isAlive) {
    var message = isAlive ? 'Session Updated' : 'Session Removed';
    message += ': ' + session.sessionId;
    appendMessage(message);
    if (!isAlive) {
      session = null;
    }
    if (!!callbackHasSession) callbackHasSession(isAlive);
};

/**
 * utility function to log messages from the receiver
 * @param {string} namespace The namespace of the message
 * @param {string} message A message string
 */
 function receiverMessage(namespace, message) {
    appendMessage("receiverMessage: "+namespace+", "+message);
};  
//#endregion initializeCastApi.sessionListener()

/**
 * receiver listener during initialization
 */
 function receiverListener(e) {
    if( e === 'available' ) {
      appendMessage("receiver found");
    }
    else {
      appendMessage("receiver list empty");
    }
}

/**
 * initialization success callback
 */
function onInitSuccess() {
    appendMessage("onInitSuccess");
}
  
/**
 * initialization error callback
 */
function onError(message) {
    appendMessage("onError: "+JSON.stringify(message));
}  
//#endregion initializeCastApi()  

/**
 * append message to debug message window
 * @param {string} message A message string
 */
 function appendMessage(message) {
    console.log(message);
    if(!!callback4appendMessage) callback4appendMessage(message);
};

/**
 * send a message to the receiver using the custom namespace
 * receiver CastMessageBus message handler will be invoked
 * @param {string} message A message string
 */
 function sendMessage(message) {
    if (session!=null) {
      session.sendMessage(namespace, message, onSuccess.bind(this, "Message sent: " + message), onError);
    }
    else {
      chrome.cast.requestSession(function(e) {
          session = e;
          if (!!callbackHasSession) callbackHasSession(true);
          session.sendMessage(namespace, message, onSuccess.bind(this, "Message sent: " + message), onError);
        }, onError);
    }
  }  

 /**
 * generic success callback
 */
function onSuccess(message) {
  appendMessage("onSuccess: "+message);
}

/**
 * stop app/session
 */
 function stopApp() {
    session.stop(onStopAppSuccess, onError);
}
/**
 * callback on success for stopping app
 */
 function onStopAppSuccess() {
  appendMessage('onStopAppSuccess');
  session = null;
  if (!!callbackHasSession) callbackHasSession(false);
}

//#region For communicating with Flutter
/// void Function(String) fun
function setCallback4appendMessage(fun) {
    callback4appendMessage = fun;
}

function isAvailable() {
  return !!window.chrome && !!chrome.cast && !!chrome.cast.isAvailable;
}

/// void Function(bool) fun
function setCallbackHasSession(fun) {
    callbackHasSession = fun;
}
//#endregion For communicating with Flutter