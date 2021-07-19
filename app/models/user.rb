class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :runs # 投稿記事と1対N
  has_many :likes, dependent: :destroy # いいねと1対N
  has_many :run_comments, dependent: :destroy # 投稿記事へのコメントと1対N
  attachment :profile_image, destroy: false
  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }

  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy # 自分がフォローされる（被フォロー）側の関係性
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy # 自分がフォローする（与フォロー）側の関係性
  has_many :followers, through: :reverse_of_relationships, source: :follower # 被フォロー関係を通じて参照→自分をフォローしている人
  has_many :followings, through: :relationships, source: :followed # 与フォロー関係を通じて参照→自分がフォローしている人

  def follow(user_id) # フォローする
    relationships.create(followed_id: user_id) # createメソッドはnewとsaveを合わせた挙動
  end

  def unfollow(user_id) # フォロー外す
    relationships.find_by(followed_id: user_id).destroy # find_byによって1レコードを特定し、destroyメソッドで削除
  end

  def following?(user) # 引数に渡したユーザを、フォローしているかどうかを判定
    followings.include?(user) # include?で対象の配列に引数が含まれていればtrue、なければfalseを返す。
  end

  # 検索機能
  def self.search_for(content, method)
    if method == 'perfect'
      User.where(name: content)
    elsif method == 'forward'
      User.where('name LIKE ?', content + '%')
    elsif method == 'backward'
      User.where('name LIKE ?', '%' + content)
    else
      User.where('name LIKE ?', '%' + content + '%')
    end
  end
end
