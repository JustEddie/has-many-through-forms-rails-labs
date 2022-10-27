class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories, reject_if: ->(attributes) { attributes['name'].blank? }, allow_destroy: true
  accepts_nested_attributes_for :users, reject_if: ->(attributes) { attributes['username'].blank? }, allow_destroy: true

  # def categories_attributes=(category_attributes)
  #   category_attributes.values.each do |category_attribute|
  #     category = Category.find_or_create_by(category_attribute)
  #     categories << category
  #   end
  # end

  # def users_attributes=(user_attributes)
  #   user_attributes.values.each do |user_attribute|
  #     user = User.find_or_create_by(user_attribute)
  #     users << user
  #   end
  # end
end
