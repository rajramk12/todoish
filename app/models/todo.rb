class Todo < ApplicationRecord
  # primary_abstract_class
  validates :name, presence: true
  validates :description, presence: true

  belongs_to :user
  default_scope { order(start_dt: :ASC) }
end
