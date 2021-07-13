class Run < ApplicationRecord

   belongs_to :user
   validates :title, presence: true
   validates :body, presence: true, length: { maximum: 200 }

  def self.search_for(content, method)
    if method == 'perfect'
      Run.where(title: content)
    elsif method == 'forward'
      Run.where('title LIKE ?', content+'%')
    elsif method == 'backward'
      Run.where('title LIKE ?', '%'+content)
    else
      Run.where('title LIKE ?', '%'+content+'%')
    end
  end
end
