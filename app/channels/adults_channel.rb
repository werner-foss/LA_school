class AdultsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "adults_#{params['adult_id']}_channel"
  end

  def unsubscribed
  end

  def send_comment(data)
    current_user.comments.create!(content: data['comment'], adult_id: data['adult_id'])
  end
end