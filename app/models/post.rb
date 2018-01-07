class Post < ActiveRecord::Base

  belongs_to :user, foreign_key: 'user_id'
  has_many :comments
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :votes, as: :voteable
  validates :title, presence: true, length: {minimum: 5}
  validates :description, presence: true

  def total_votes
    self.votes.where(vote: true).size - self.votes.where(vote: false).size
  end


end
