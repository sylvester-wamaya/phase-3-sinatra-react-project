class Station < ActiveRecord::Base
    has_many :voters
    validates :name, presence: true, uniqueness: true
end