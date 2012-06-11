class Deal < ActiveRecord::Base
  def price
    (price_reduced > 0) ? price_reduced : price_original
  end
end
