class Reply < ActiveRecord::Base
    belongs_to :post
    #validates :reply_content, presence: { message: "리플을 입력해주세요" }
end
