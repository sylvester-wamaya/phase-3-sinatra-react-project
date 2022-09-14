class Station < ActiveRecord::Base
    has_many :voters
end