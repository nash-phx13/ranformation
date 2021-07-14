class RunComment < ApplicationRecord
	belongs_to :user #1つのuserに関連
	belongs_to :run  #1つのrunに関連

	validates :comment, presence: true #コメントされている時true

end
