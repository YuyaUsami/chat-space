$(function() {
  function buildHTML(message) {
    var html = "<div class = 'chat-main-message-title'>" + "<p class = 'chat-main-message-title__name' >" + message.name + "</p>" +"<p class =  'chat-main-message-title__time' >" + message.time + "</p>" + "</div>" +"<p class = 'chat-main-message__message'>" + message.body + "</p>";
    return html;
  }

  $('.js-form').on('submit', function(e) {
    console.log('ajax')
    e.preventDefault();
    var textField = $('.input_message');
    var message = textField
    var jsonUrl = window.location.href;

    $.ajax({
      type: 'POST',
      url: jsonUrl,
      data: message,
      dataType: 'json'
    })

    .done(function(data) {
      console.log("hogehoge");
      var html = buildHTML(data);
      $('.chat-main-message').append(html);
      textField.val('');
    })
    .fail(function() {
      alert('error');
    });
  });
});
