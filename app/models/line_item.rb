class LineItem < ActiveRecord::Base
  after_initialize :default_values

  belongs_to :cart
  belongs_to :deal

  def price
    quantity * deal.price
  end

  private
    def default_values
      self.quantity = 1 if self.quantity.nil?
    end
end
