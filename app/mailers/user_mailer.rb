class UserMailer < ActionMailer::Base
  default :from => "noreply.needafourth@gmail.com"

  def registration_confirmation
  mail(:to => "matthew.olson808@gmail.com", :subject => "Registered")
  end

  def player_confirmation(user, player)
    @user = user
    @player = player
    mail(:to => user.email, :subject => "Teetime Request")
  end

end

