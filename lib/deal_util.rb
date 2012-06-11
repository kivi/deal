module DealUtil
  def datetime_to_remaining(ends_at)
    time_diff = (ends_at - Time.now)
    s = time_diff % 1.day % 1.hour % 1.minute / 1.second
    m = time_diff % 1.day % 1.hour / 1.minute
    h = time_diff - m.minute % 1.day / 1.hour
    d = time_diff / 1.day
    [s,m,h,d]
  end
end