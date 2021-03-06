class User < ActiveRecord::Base
  has_many :teetimes
  has_one :profile
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, :state, :city, presence: true
  after_create :create_profile


  def create_profile
    self.profile = Profile.new
  end

end
