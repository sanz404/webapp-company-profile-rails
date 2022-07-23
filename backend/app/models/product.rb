class Product < ApplicationRecord
    belongs_to :category, class_name: 'CategoryProduct', foreign_key: 'category_id', optional: false
end
