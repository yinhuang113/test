module ApplicationHelper
def msg_body(msg)
    if msg.length > 30
      msg[0,27]+"..."
    else
      msg
    end
  end

end
