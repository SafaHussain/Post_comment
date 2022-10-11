class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   # validates_presence_of :email, :password, :name, :address

has_many :posts
has_many :comments
enum role: [:admin, :user]
after_initialize do
  if self.new_record?
    self.role ||= :user
  end
end

enum status: [:pending, :active, :inactive]
after_initialize do
  if self.new_record?
   self.status ||= :pending
  end
end
def active_for_authentication?
  super && self.active?
end

end
