class Project < ActiveRecord::Base
  attr_accessible :description, :title, :team_id

  # validates :description, presence: true # ???
  validates :title, presence: true
  validates :team_id, presence: true

  has_many :items, class_name: "Item", primary_key: :id,
  foreign_key: :project_id, dependent: :destroy

  belongs_to :team, class_name: "Team", primary_key: :id,
  foreign_key: :team_id

end
