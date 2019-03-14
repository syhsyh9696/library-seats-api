module TaskLib
  def tuesday_tomorrow?
    return (Time.now + 1.day).wday.eql?(2) ? true : false
  end

  def fake_reservation
    user = Jovian.new(220141222001, 100325)
    user.book(40942, 1200, 1260, 0)
  end

  def fake_cancel
    user = Jovian.new(220141222001, 100325)
    user.cancel_the_recent_one
  end

  def server_on?
    result = fake_reservation
    if result['status'] == 'success' && result['code'] == '0'
      fake_cancel
      return true
    elsif result['status'] == 'fail' && result['code'] == '1'
      return false
    end
  end

end