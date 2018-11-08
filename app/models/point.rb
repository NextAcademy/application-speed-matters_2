class Point < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :user, :label
  validates :value, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  before_save :update_record

  def update_record
  	self.user.total_points += value
  	self.user.save
  end

end
