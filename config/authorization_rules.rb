authorization do
  role :administrador do
    has_permission_on [:companies, :users], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    has_permission_on [:works], :to => [:send_prevision_email, :update_city_select, :index, :show, :new, :create, :edit, :update, :destroy]
    has_permission_on [:users], :to => [:edit_profile, :update_profile]
    has_permission_on [:companies], :to => [:import, :upload]
    has_permission_on [:comments], :to => [:new_comment, :create, :edit, :update, :destroy]
  end
  
  role :usuario do
    has_permission_on [:works], :to => [:update_city_select, :index, :show, :new, :create]
    has_permission_on [:users], :to => [:edit_profile, :update_profile]
    has_permission_on :comments, :to => [:new_comment, :create]
    has_permission_on :comments, :to => [:edit, :update] do
      if_attribute :user => is { user }
    end
  end
end