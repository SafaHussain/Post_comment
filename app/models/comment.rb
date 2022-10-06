class Comment < ApplicationRecord
 belongs_to :post
 belongs_to :user

validates :description, :presence => {:message => "Description can't be blank." }

end