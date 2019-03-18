module TaskLib
  def tuesday_tomorrow?
    return (Time.now + 1.day).wday.eql?(2) ? true : false
  end

  def fake_reservation
    user = Jovian.new(220141921032, 190024)
    user.book(40718, 420, 480, 1)
  end

  def fake_cancel
    user = Jovian.new(220141921032, 190024)
    user.cancel_the_recent_one
  end

  def server_on?
    result = fake_reservation
    if result['status'] == 'fail' && result['message'][0..6] = '系统可预约时间'
      return false
    else
      fake_cancel
      return true
    end
  end

end