class RunComment < ApplicationRecord
  belongs_to :user # 1つのuserに関連
  belongs_to :run  # 1つのrunに関連

  validates :comment, presence: true # コメントされている時true>>
  validates :evaluation, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1,
  }, presence: true
end
