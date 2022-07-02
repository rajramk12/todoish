class Todo < ApplicationRecord
  # primary_abstract_class
  validates :name, presence: true
  validates :description, presence: true
end
