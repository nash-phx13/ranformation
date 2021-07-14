class Like < ApplicationRecord
	belongs_to :user                                  #1つのuserに関連
	belongs_to :run                                   #1つのrunに関連
	validates_uniqueness_of :book_id, scope: :user_id #重複してしないこと
end
