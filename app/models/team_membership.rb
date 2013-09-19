class TeamMembership < ActiveRecord::Base
  attr_accessible :team_id, :user_id

  validates :team_id, presence: true
  validates :user_id, presence: true

  belongs_to :team, class_name: "Team", primary_key: :id,
  foreign_key: :team_id

  belongs_to :user, class_name: "User", primary_key: :id,
  foreign_key: :user_id


end
