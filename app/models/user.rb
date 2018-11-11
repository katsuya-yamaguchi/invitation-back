class User < ApplicationRecord
  #include DecodeJwt
  def change_attend_status(json_data)
    data = JSON.parse(json_data)
    token = data['token']
    status = data['status']
    user_data = DecodeJwt.decode(token)
    email = user_data['email']
    user_id = user_data['user_id']
    user = User.where(email: email)
    begin
      user.update_all(attend_status: status, sid: user_id)
      return 0
    rescue => e
      logger.error e
      return 1
    end
  end

  def change_allelgy_status(json_data)
    data = JSON.parse(json_data)
    token = data['token']
    status = data['status']
    user_data = DecodeJwt.decode(token)
    email = user_data['email']
    user_id = user_data['user_id']
    user = User.where(email: email)
    begin
      user.update_all(user_allergy: status, sid: user_id)
      return 0
    rescue => e
      logger.error e
      return 1
    end
  end
end
