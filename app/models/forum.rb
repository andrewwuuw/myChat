class Forum < ApplicationRecord
  validates :title, presence: true

  has_many :messages, :dependent => :destroy
  # 當 :messages 有資料刪除時，forum 的資料執行 :destroy
  # 把依賴的attendees也一併刪除，並且執行Attendee的destroy回呼
end
