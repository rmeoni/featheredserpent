class Destination < ActiveRecord::Base
	belongs_to :tag
	has_many :messages
	has_many :tips
end
