class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable, :timeoutable
  devise :timeoutable, timeout_in: 15.minutes
  has_many :reports
  validates :username, uniqueness: :true
end
