class Author < ApplicationRecord
  has_many :books
  default_scope { order(name: :asc) }

  validates :name, presence: true, length: { minimum: 5 }, uniqueness: true
  validates :description, presence: true, length: { minimum: 15 }, uniqueness: true
end
