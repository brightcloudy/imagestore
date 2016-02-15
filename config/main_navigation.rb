SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :splash, 'Home', root_path 
    primary.item :upload, 'Upload', new_image_path, :if => Proc.new {user_signed_in?}
    primary.item :my_images, "My Images <span class=\"badge\">#{user_image_count}</span>", images_path, :if => Proc.new {user_signed_in?}
    primary.dom_class = 'nav navbar-nav'
  end
end
