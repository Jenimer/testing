class Task < ApplicationRecord
  belongs_to :list
  def self.by_name
    order(:name)
  end

  def self.by_body
    order(:body)
  end
end
