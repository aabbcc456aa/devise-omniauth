module ApplicationHelper
  def follow_info(resource_name,user,provider)
    hidden_field :user, "#{provider}_uid", user.try("#{provider}_uid")
  end
end
