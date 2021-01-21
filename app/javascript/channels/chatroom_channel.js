import consumer from "./consumer"

consumer.subscriptions.create("ChatroomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    $('#message-container').append(data.message);
    let messagesElement = $('#messages');
    if (messagesElement.length > 0) {
      messagesElement.scrollTop(messagesElement[0].scrollHeight);
    }
  }
});
