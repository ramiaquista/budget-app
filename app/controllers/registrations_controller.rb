class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(_resource)
    categories_path
  end

  def after_sign_out_path_for(_resource_or_scope)
    root_path
  end
end
