class Faq < ApplicationRecord
    belongs_to :category, class_name: 'CategoryFaq', foreign_key: 'category_id', optional: false
end
