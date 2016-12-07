class Point < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :user, :label
  validates :value, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
