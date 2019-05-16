urlParams = new URLSearchParams(window.location.search)

if urlParams.has('nickname')
    App.chat = App.cable.subscriptions.create {channel: 'ChatChannel', nickname: urlParams.get('nickname'), room: urlParams.get('room')},
        connected: -> 
            # Called when the subscription is ready for use on the server

        disconnected: ->
            # Called when the subscription has been terminated by the server

        received: (data) ->
            node = document.createElement('li')
            node.textContent = data['message']
            document.getElementById('messages').appendChild(node)
        
        chat: (message) ->
            document.getElementById('message').value = ''
            @perform 'chat', message: message
