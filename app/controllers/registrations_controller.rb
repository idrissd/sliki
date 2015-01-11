class RegistrationsController < Devise::RegistrationsController

  def destroy
    if resource.destroy
      Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
      set_flash_message :notice, :destroyed if is_navigational_format?
      respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }
    else
      flash[:error] = "At least one other adminisrator is required before your registration can be deleted."
      respond_with_navigational(resource)
    end
  end

  def new
    build_resource({})
    @validatable = devise_mapping.validatable?
    if @validatable
      @minimum_password_length = resource_class.password_length.min
    end
    respond_with self.resource
  end

  # GET /resource/edit
  def edit
    # render :cms_layout => 'default'
    # render :edit
  end

  protected

  def after_inactive_sign_up_path_for(resource)
    root_path
  end

  def after_update_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

end