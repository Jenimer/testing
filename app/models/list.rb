class List < ApplicationRecord
  belongs_to :board
  has_many :tasks

  def self.by_name
    order(:name)
  end

  def self.by_position
    order(:position)
  end
  
end
