module ApplicationHelper
	def user_image(user)
    image_path = user.image_name? ? user.image_name.url : "user_images/default_user.png"
    image_tag(image_path, class: "each_image")
end
end
