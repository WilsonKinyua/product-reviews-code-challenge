class User < ActiveRecord::Base
    has_many :products

    # returns a collection of all reviews for the user
    def reviews
        Review.where(user_id: self.id)
    end

    # returns a collection of all products that the user has reviewed
    def products
        self.reviews.map do |review|
            review.product
        end
    end

    def favorite_product
        self.products.max_by do |product|
            product.average_rating
        end
    end

    def remove_reviews(product)
        self.reviews.each do |review|
            if review.product == product
                review.destroy
            end
        end
    end
end