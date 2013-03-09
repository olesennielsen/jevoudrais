class GiftCreators::RegistrationsController < Devise::RegistrationsController

  def create
    
    
        
    # @credit_card = ActiveMerchant::Billing::CreditCard.new(
    # :first_name         => resource.first_name,
    # :last_name          => resource.last_name,
    # :number             => resource.credit_card_number,
    # :month              => resource.month,
    # :year               => resource.year,
    # :verification_value => resource.cvv)
    
    # copied from devise::registrationscontroller
    build_resource

    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
        return
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
        return
      end
    else
      clean_up_passwords resource
      respond_with resource
      return
    end
  end
end
