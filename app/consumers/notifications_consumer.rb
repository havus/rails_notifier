# frozen_string_literal: true

class NotificationsConsumer < ApplicationConsumer
  def consume
    params_batch.each do |message|
      ActionCable.server.broadcast 'main', message.raw_payload
    end
  end
end
