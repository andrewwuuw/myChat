App.forum = App.cable.subscriptions.create "ForumChannel",
  connected: (data)->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    channel_id = parseInt(window.location.href.split('forums/')[1])
    #取得當前網站網址，以 forums/ 做中心分割兩邊，再取陣列 [1] 之值
    if channel_id is data.channel_id
      $('#messages').append(data['message'])
      window.location.reload()
    end

  speak:(msg) ->
    @perform 'speak', message: msg, channel: msg.formAction

$(document).on 'keypress', '[data-behavior~=forum_speaker]', (e) ->
  if e.keyCode is 13 #enter
    App.forum.speak e.target.value
    e.target.value = ''
    e.preventDefault()
