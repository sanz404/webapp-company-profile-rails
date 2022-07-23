class Project < ApplicationRecord
    belongs_to :category, class_name: 'CategoryProject', foreign_key: 'category_id', optional: false
end
