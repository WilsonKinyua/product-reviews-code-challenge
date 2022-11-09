class Product < ActiveRecord::Base
    has_many :reviews
    has_many :users, through: :reviews
    
    def leave_review(user, star_rating, comment)
        Review.create(user: user, product: self, comment: comment, star_rating: star_rating)
    end

    def print_all_reviews 
        self.reviews.each do |review|
            puts "Review for #{self.name} by #{review.user.name}: #{review.star_rating}. #{review.comment}"
        end
    end

    def average_rating
        self.reviews.average(:star_rating).to_f
    end

end