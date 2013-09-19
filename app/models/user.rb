class User < ActiveRecord::Base
  attr_accessible :name, :team_ids

  validates :name, presence: true

  has_many :team_memberships, class_name: "TeamMembership", primary_key: :id,
  foreign_key: :user_id, dependent: :destroy

  has_many :teams, through: :team_memberships, source: :team, inverse_of: :members

  def team_ids=(ids)
    self.teams = ids.map { |id| Team.find(id) }
  end
end
