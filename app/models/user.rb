class User < ActiveRecord::Base
  has_many :points

  validates_presence_of :first_name, :last_name
  before_create :set_value

  validates :username,
            presence: true,
            length: { minimum: 2, maximum: 32 },
            format: { with: /^\w+$/, multiline: true },
            uniqueness: { case_sensitive: false },
            on: :create

  validates :email,
            presence: true,
            format: { with: /^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/i, multiline: true },
            uniqueness: { case_sensitive: false },
            on: :create

  def self.by_total_points
    order('total_points DESC')
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def set_value
    self.total_points.to_i 
  end
end
