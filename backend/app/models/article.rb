class Article < ApplicationRecord
    belongs_to :user, class_name: 'User', foreign_key: 'user_id', optional: false
    has_and_belongs_to_many :categories, class_name: 'CategoryArticle', :join_table => 'article_categories'
end
