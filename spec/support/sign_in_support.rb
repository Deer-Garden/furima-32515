module SignInSupport
  def sign_in(user)
    visit root_path
    fill_in 'user_email', with: user.email
    fill_in 'user_encrypted_password', with: user.encrypted_password
    fill_in 'nickname',with: user.nickname
    fill_in 'first_name', with: user.first_name
    fill_in 'last_name', with: user.last_name
    fill_in 'fname', with: user.fname
    fill_in 'lname', with: user.lname
    fill_in 'birthday', with: user.birthday
    click_on("Log in")
    expect(current_path).to eq root_path
  end
end