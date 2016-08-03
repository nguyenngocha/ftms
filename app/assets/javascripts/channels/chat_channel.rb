def render_message(message)
  ApplicationController.render(
    partial: 'messages/message',
    locals: {
      message: message,
      username: current_user
    })
end
