SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    if !user_signed_in?
      primary.item :login, 'Login', new_user_session_path
      primary.item :signup, "Sign Up", new_user_registration_path
    else
      primary.item :cur_user, current_user.email do |actions|
        actions.item :edit_pwd, 'Edit Password', edit_user_registration_path
        actions.item :edit_numbers, 'Edit Phone Numbers', phone_number_index_path
        actions.item :logout, 'Logout', destroy_user_session_path, :method => :delete
      end
    end
    primary.dropdown = true
    primary.dom_class = 'nav navbar-nav navbar-right'
  end
end
