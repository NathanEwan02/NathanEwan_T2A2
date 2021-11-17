class User < ApplicationRecord
  after_create :set_role

  rolify

  belongs_to :team, optional: true
  has_many :user_games
  has_many :games, through: :user_games
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, uniqueness: true

  def set_role
    self.add_role(:player)
  end

end
