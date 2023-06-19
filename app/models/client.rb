class Client < ApplicationRecord
  has_many :cars, dependent: :destroy
  has_many :orders, dependent: :destroy

  delegate :make, to: :car, allow_nil: true

  validates :licence, :data, presence: true
  validates :licence, length: { in: 1..10 }

  # store_accessor :images, :avatar, :background


  def orders?
    true if self.orders.present?
  end

  def work_performer(user)
    self.username = user.name if user
    self
  end
  
#  def max_mileag
#   self.orders.last.mileage if self.orders.present?
#  end

end
