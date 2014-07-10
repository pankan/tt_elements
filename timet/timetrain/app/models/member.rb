class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :password,:presence=>true,:on=>:create

  has_many :twitter_models , dependent: :destroy
  has_many :google_models , dependent: :destroy

  def self.update_records (user)

  	TwitterModel.store_urls(user) if user.twitter_id.present? 
  	GoogleModel.store_urls(user) if user.gplus_id.present?

  #	redirect_to members_timeline_path


  end


end
