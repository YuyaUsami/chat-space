$(function(){

  function buildSearchedUserHTML(user) {
    var html =
      '<div class="chat-group-form__field--right">' +
        '<p class="chat-group-user__name">' +
          user.name +
        '</p>' +
        '<a class="chat-group-user__add-button" data-user_id=" ' +
            user.id +
          '" data-user_name="'+user.name+'">追加</a>' +
      '</div>'
    return html;
  }

  function buildAddedUserHTML(name, id) {
    var html =
      '<div class="chat-group-form__field--right">' +
        '<input type="hidden" name="group[user_ids][]" value="' + id + '">' +
        '<p class="chat-group-user__name">' +
          name +
        '</p>' +
          '<a class="chat-group-user__delete-button">削除</a>'+
      '</div>'
    return html;
  }

$('#user-search-field').keyup(function() {
  word = $('#user-search-input').val();
  $.ajax({
    type: 'GET',
    url: '/users.json',
    data: { name: word },
    dataType: 'json'
  })
  .done(function(users) {
      var insertHTML = "";
      users.forEach(function(user){
        insertHTML += buildSearchedUserHTML(user);
      });
      $('#user-search-result').html(insertHTML);
  })
  .fail(function(users) {
    alert('エラーが発生しました');
  });
});

$('#user-search-result').on('click', '.chat-group-user__add-button',function() {
  var user = $(this);
  var name = user.data('user_name');
  var id = user.data('user_id');
  var insertHTML = buildAddedUserHTML(name, id);
  $('#user-add-list').append(insertHTML);
    user.parent('.chat-group-form__field--right').remove();
});

$('#user-add-list').on('click', '.chat-group-user__delete-button',function(){
  var user = $(this);
  var id = user.data('user_id');
  user.parent('.chat-group-form__field--right').remove();
  });
});
