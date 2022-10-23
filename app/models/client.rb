class Client < ApplicationRecord
  has_many :cars, dependent: :destroy
  has_many :orders, dependent: :destroy

  validates :licence, :data, presence: true
  validates :licence, length: { in: 6..10 }

  def orders?
    true if self.orders.present?
  end

#  def max_mileag
#   self.orders.last.mileage if self.orders.present?
#  end

end
