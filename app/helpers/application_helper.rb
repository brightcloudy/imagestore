module ApplicationHelper
  def paperclip_hash_secret
    Rails.application.secrets.paperclip_hash_secret
  end
  
  def user_image_count
    if user_signed_in?
      return Image.where("user_id = ?", current_user.id).count
    else
      return 0
    end
  end

  def remote_url(path)
    return "http://" + Rails.application.routes.default_url_options[:host] + path
  end
end
