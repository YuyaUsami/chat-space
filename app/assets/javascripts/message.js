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
    reloadPage();
  });
  function reloadPage(){
    setInterval(function reload(){
      $.ajax({
        type: 'GET',
        url: './messages',
        dataType: 'json',
      })
      .done(function(data){
        var insertHTML = '';
        var count_old = $('.chat-main-message').length;
        var count_new = data.length;
        for(var i = count_old; i < count_new; i++) {
          insertHTML += buildHTML(data[i]);
        };
        $('.chat-main-messages').append(insertHTML)
      });
    }, 1000);
  };
});
