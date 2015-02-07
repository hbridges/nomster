class Place < ActiveRecord::Base
	belongs_to :user

	geocoded_by :address
	after_validation :geocode

	validates :name, :presence => true, :length => { :maximum => 50, :minimum => 3},
	 :uniqueness => {:scope => [:address]}
	validates :address, :presence => true, :length => { :maximum => 50, :minimum => 3},
	:uniqueness => {:scope => [:name]}
	validates :description, :presence => true, :length => { :maximum => 200, :minimum => 3}

end
