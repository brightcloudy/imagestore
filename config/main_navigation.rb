SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :splash, 'Home', root_path 
    primary.dom_class = 'nav navbar-nav'
  end
end
