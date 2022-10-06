class Post < ApplicationRecord
belongs_to :user
has_many :comments

has_many_attached :images

has_rich_text :title

validates :title, presence: true
validates :images, presence: true

enum status: [:approved, :pending, :unapproved]


end