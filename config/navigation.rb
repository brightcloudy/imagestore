SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :splash, 'Home', root_path 
    primary.item :login, 'Login', new_user_session_path, class: 'navbar-right', if: -> { !user_signed_in? }
    primary.dom_class = 'nav navbar-nav'
  end
end
