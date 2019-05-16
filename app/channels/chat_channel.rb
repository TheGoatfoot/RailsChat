class ChatChannel < ApplicationCable::Channel
  def subscribed
    @room_name = "Chat_#{params["room"]}"
    ActionCable.server.broadcast @room_name, message: "#{params["nickname"]} has joined the room."
    stream_from(@room_name)
  end

  def unsubscribed
    ActionCable.server.broadcast @room_name, message: "#{params["nickname"]} has left the room."
  end

  def chat(data)
    ActionCable.server.broadcast @room_name, message: "#{params["nickname"]}: #{data["message"]}"
  end
end
