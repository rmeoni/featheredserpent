class Tag < ActiveRecord::Base
	belongs_to :country
	has_many :destinations
end

