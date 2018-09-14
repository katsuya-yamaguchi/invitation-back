class User < ApplicationRecord
  include DecodeJwt
  def changeAttendStatus(json_data)
    data = JSON.parse(json_data)
    token = data['token']
    status = data['status']
    user_data = decode(token)
    email = user_data['email']
    user_id = user_data['user_id']
    user = User.where(email: email)
    begin
      user.update_all(attend_status: status, sid: user_id)
      return 0
    rescue => error
      p error
      return 1
    end
  end
end
