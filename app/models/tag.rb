class Tag < ApplicationRecord
  has_many :tag_maps, dependent: :destroy, foreign_key: 'tag_id'
  has_many :runs, through: :tag_maps
  
  
  validates :tag_name, presence: true, uniqueness: true, length: { maximum: 50 }

  private

    # タグ名を小文字に変換
    def downcase_tag_name
      self.tag_name.downcase!
    end
  
end
