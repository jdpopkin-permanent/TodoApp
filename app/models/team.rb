class Team < ActiveRecord::Base
  attr_accessible :name

  has_many :projects, class_name: "Project", primary_key: :id,
  foreign_key: :team_id, dependent: :destroy

end
