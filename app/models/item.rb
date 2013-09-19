class Item < ActiveRecord::Base
  attr_accessible :completed, :description, :project_id, :title

  validates :completed, inclusion: { in: [true, false] }
  # validates :description ???
  validates :project_id, presence: true
  validates :title, presence: true

  belongs_to :project, class_name: "Project", primary_key: :id,
  foreign_key: :project_id

end
