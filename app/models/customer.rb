class Customer < ActiveRecord::Base
	belongs_to :user
	has_many :waitlist

    
end
