class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  validates :title,presence:true
  validates :body,presence:true,length: { maximum: 200 }

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.looks(search,ward)
    if search == "perfect_match"
      @book = Book.where("title LIKE?","#{ward}")
    elsif search == "forward_match"
      @book = Book.where("title LIKE?","#{ward}%")
    elsif search == "backward_match"
      @book = Book.where("title LIKE?","%#{ward}")
    elsif search == "partial_match"
      @book = Book.where("title LIKE?","%#{ward}%")
    else
      @book = Book.all
    end
  end

  scope :created_today, -> {where(created_at: Time.zone.now.all_day)}
  scope :created_oneday_ago, -> {where(created_at: 1.day.ago.all_day)}
  scope :created_twoday_ago, -> {where(created_at: 2.day.ago.all_day)}
  scope :created_threeday_ago, -> {where(created_at: 3.day.ago.all_day)}
  scope :created_fourday_ago, -> {where(created_at: 4.day.ago.all_day)}
  scope :created_fiveday_ago, -> {where(created_at: 5.day.ago.all_day)}
  scope :created_sixday_ago, -> {where(created_at: 6.day.ago.all_day)}
  scope :created_week, -> {where(created_at: 6.day.ago.beginning_of_day..Time.zone.now.end_of_day)}
  scope :created_last_week, -> {where(created_at: 2.week.ago.beginning_of_day..1.week.ago.end_of_day)}
end
