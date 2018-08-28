class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?
	def after_sign_in_path_for(resource)
  		user_path(current_user)
	end

  def after_sign_out_path_for(resource)
      root_path
  end

	def ensure_correct_user
    if @current_user.id != params[:id].to_i
    flash[:notice] = "権限がありません"
    redirect_to("/root/top")
    end
    end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
