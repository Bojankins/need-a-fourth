def login_as(user)
  if Capybara.current_driver.in? [:webkit, :poltergeist]
    visit '/'
    click_link "login"
    fill_in "Email", with: user.email
    fill_in "Password", with: "password1"
    click_button "Log in"
 else
    page.driver.follow(:post, user_session_url, { user: { email: user.email, password: "password1"} })
 end
end
