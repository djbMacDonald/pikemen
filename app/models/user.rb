class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable, :timeoutable
  validates_uniqueness_of :username
  devise :timeoutable, :timeout_in => 15.minutes
end
