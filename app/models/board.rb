class Board < ApplicationRecord
    has_many :lists
    def self.by_name
        order(:name)
    end

    def self.by_body
        order(:body)
    end
end
