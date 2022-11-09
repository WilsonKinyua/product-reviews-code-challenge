class Review < ActiveRecord::Base
    belongs_to :user
    belongs_to :product

    # returns the user instance method for this review
    def user
        User.find(self.user_id)
    end

    # returns the product instance method for this review
    def product
        Product.find(self.product_id)
    end

    def print_review
        puts "Review for #{self.product.name} by #{self.user.name}: #{self.star_rating}. #{self.comment}"
    end
    
end