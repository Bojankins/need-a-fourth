class Profile < ActiveRecord::Base
  belongs_to :user

  before_create :default_values

  def default_values
    self.description = "Please tell us a little about yourself." 
    self.gear = "List the equipment you use here."
  end
end
