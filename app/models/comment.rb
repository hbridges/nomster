class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :place
	after_create :send_comment_email

	RATINGS = {
		'one star'		=> '1_star',
		'two stars'		=> '2_star',
		'three stars'	=> '3_star',
		'four stars'	=> '4_star',
		'five stars'	=> '5_star',
	}
	def humanized_rating
		RATINGS.invert[self.rating]
	end

	def send_comment_email
		NotificationMailer.comment_added(self).deliver
	end

	validates :message, :presence => true 
end
