class RegistrationsController < Devise::RegistrationsController
  # protected

  # def after_sign_in_path_for(resource)
  #   '/an/example/path'
  # end

  # # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   after_sign_in_path_for(resource)
  # end

  # # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   respond_to?(:root_path) ? root_path : "/"
  # end

  # # The default url to be used after updating a resource.
  # def after_update_path_for(resource)
  #   signed_in_root_path(resource)
  # end
end