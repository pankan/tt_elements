class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :password,:presence=>true,:on=>:create

  has_many :twitter_models , dependent: :destroy
  has_many :google_models , dependent: :destroy

end
