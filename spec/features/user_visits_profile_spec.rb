
feature "User visits profile page." do

  background do
    @user = Fabricate(:user)
  end


  scenario "Successfully Adds a Teetime" do
    visit '/'
    login_as @user
    page.should have_content("logged in as #{@user.email}")
    click_link "Add Your First Teetime"
    current_path.should == new_teetime_path
    fill_in "Date", with: "2014-09-09 15:37:31"
    fill_in "Course", with: "Paul Walker"
    fill_in "Golfer 1", with: "#{@user.name}"
    page.should have_content("You Created a Teetime Paul Walker")
  end
end