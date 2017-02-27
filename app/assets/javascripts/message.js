$(function() {
  function buildHTML(message) {
    var insertImage = '';
    if (message.image.image.url) {
      var insertImage = `<img src="${ message.image.image.url }">`;
    }
    var html = `<div class = 'chat-main-message-title'>
                  <p class = 'chat-main-message-title__name' >${message.name}</p>
                  <p class = 'chat-main-message-title__time' >${message.time}</p>
                </div>
                <p class = 'chat-main-message__message'>${message.body} ${insertImage} </p>`;
    return html;
  }
  $('.js-form').on('submit', function(e) {
    e.preventDefault();
    fm = new FormData($(".js-form").get(0));
    $.ajax({
      type: 'POST',
      url: './messages',
      data: fm,
      dataType: 'json',
      contentType : false,
      processData : false
    })
    .done(function(data) {
      var html = buildHTML(data);
      $('.chat-main-message').append(html);
      $('.js-form')[0].reset();
    })
    .fail(function() {
      alert('error');
    });
  });
  setInterval(reload, 1000)
  function reload (){
  $.ajax({
    type: 'GET',
    url: window.location.href,
    dataType: 'json'
  })
  .done(function(message){
    $('.chat-main-message').remove();
      messages.forEach(function(message){
        insertHTML += buildHTML(message);
      });
    $('.chat-main-messages').append(insertHTML)
    });
    console.log('aaa')
  };
});
