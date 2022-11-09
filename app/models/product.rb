class Product < ActiveRecord::Base
    has_many :users
    has_many :reviews

    # returns a collection of all reviews for the product
    def reviews
        Review.where(product_id: self.id)
    end

    # returns a collection of all users who have reviewed the product
    def users
        self.reviews.map do |review|
            review.user
        end
    end

    def leave_review(user, star_rating, comment)
        Review.create(user: user, product: self, comment: comment, star_rating: star_rating)
    end

    def print_all_reviews 
        self.reviews.each do |review|
            puts "Review for #{self.name} by #{review.user.name}: #{review.star_rating}. #{review.comment}"
        end
    end

    def average_rating
        total = 0
        self.reviews.each do |review|
            total += review.star_rating
        end
        total.to_f / self.reviews.count
    end

end