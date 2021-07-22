class TagMap < ApplicationRecord
  belongs_to :run
  belongs_to :tag
  
  validates :run_id, presence: true
  validates :tag_id, presence: true
end
