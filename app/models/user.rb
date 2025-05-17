class User < ApplicationRecord
  before_create :set_uuid
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :planners, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  # bookmark
  def bookmark(record)
    bookmarks.find_or_create_by(bookmarkable: record)
  end

  def unbookmark(record)
    bookmark = bookmarks.find_by(bookmarkable: record)
    bookmark&.destroy
  end

  def bookmarked?(record)
    bookmarks.exists?(bookmarkable: record)
  end


  private

  def set_uuid
    self.id ||= SecureRandom.uuid
  end
end
