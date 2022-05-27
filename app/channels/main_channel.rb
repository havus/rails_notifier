# frozen_string_literal: true

class MainChannel < ApplicationCable::Channel
  rescue_from StandardError, with: :report_error

  # Called when the consumer has successfully
  # become a subscriber to this channel.
  def subscribed
    stream_from 'main'
    # ActionCable.server.broadcast 'main', 'lorem'
  end

  private

  def report_error(_e)
    # broadcast_to(...)
  end
end
