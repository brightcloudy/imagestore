class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_attached_file :avatar, styles: { big: "250x250#", thumbnail: "60x60#"}
  validates_attachment :avatar, content_type: { content_type: ["image/jpeg", "image/png", "image/jpg"] }
end
