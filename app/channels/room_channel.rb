class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'chat'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def post_message(data)
    ActionCable.server.broadcast 'chat', message: data['message']
  end
end
