class Run < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :run_comments, dependent: :destroy
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }
  attachment :image

  # 引数で渡されたユーザidがLikeテーブル内に存在（exists?）するかの判断
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

# タグ付け
  def save_tag(sent_tags)
  end

#投稿数
  scope :created_today, -> { where(created_at: Time.zone.now.all_day) } # 今日
  scope :created_yesterday, -> { where(created_at: 1.day.ago.all_day) } # 前日
  scope :created_2day_ago, -> { where(created_at: 2.day.ago.all_day) } # 2日前
  scope :created_3day_ago, -> { where(created_at: 3.day.ago.all_day) } # 3日前
  scope :created_4day_ago, -> { where(created_at: 4.day.ago.all_day) } # 4日前
  scope :created_5day_ago, -> { where(created_at: 5.day.ago.all_day) } # 5日前
  scope :created_6day_ago, -> { where(created_at: 6.day.ago.all_day) } # 6日前

  # 検索機能
  def self.search_for(content, method)
    if method == 'perfect'
      Run.where(title: content)
    elsif method == 'forward'
      Run.where('title LIKE ?', content + '%')
    elsif method == 'backward'
      Run.where('title LIKE ?', '%' + content)
    else
      Run.where('title LIKE ?', '%' + content + '%')
    end
  end
end
