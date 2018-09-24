module ActivitiesHelper
	def user_image(user, options = {class: "each_image"})
    image_path = user.image_name? ? user.image_name.url : "user_images/default_user.png"
    image_tag(image_path, options)
	end
end
