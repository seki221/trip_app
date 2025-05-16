class User < ApplicationRecord
  before_create :set_uuid
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :planners, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  private

  def set_uuid
    self.id ||= SecureRandom.uuid
  end
end
