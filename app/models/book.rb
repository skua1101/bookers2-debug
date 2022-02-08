class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites,dependent: :destroy
  has_many :book_comments,dependent: :destroy
  has_one_attached :profile_image

  validates :title,presence: true
  validates :body,presence: true,length:{maximum:200}
  validates :evalution, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1}, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def Book.search(search, model, how)
    if how == "partical"
  	  Book.where("title LIKE ?", "%#{search}%")
    elsif how == "forward"
  	  Book.where("title LIKE ?", "#{search}%")
    elsif how == "backward"
  	  Book.where("title LIKE ?", "%#{search}")
    elsif how == "match"
  	  Book.where("title LIKE ?", "#{search}")
    end
  end
end