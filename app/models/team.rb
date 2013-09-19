class Team < ActiveRecord::Base
  attr_accessible :name

  has_many :projects, class_name: "Project", primary_key: :id,
  foreign_key: :team_id, dependent: :destroy

  has_many :team_memberships, class_name: "TeamMembership", primary_key: :id,
  foreign_key: :team_id, dependent: :destroy

  has_many :members, through: :team_memberships, source: :user, inverse_of: :teams
end
