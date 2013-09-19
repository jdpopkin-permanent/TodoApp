class Project < ActiveRecord::Base
  attr_accessible :description, :title

  # validates :description, presence: true # ???
  validates :title, presence: true

  has_many :items, class_name: "Item", primary_key: :id,
  foreign_key: :project_id


end
