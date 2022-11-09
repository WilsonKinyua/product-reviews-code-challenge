class User < ActiveRecord::Base
    has_many :reviews
    has_many :products, through: :reviews

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