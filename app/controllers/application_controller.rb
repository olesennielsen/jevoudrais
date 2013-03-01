class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end


  # overriding CanCan::ControllerAdditions
  def current_ability
    if current_account.kind_of?(GiftCreator)
      @current_ability ||= CreatorAbility.new(current_account)
    else
      @current_ability ||= Ability.new(current_account)
    end
  end

end
