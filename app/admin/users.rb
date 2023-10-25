ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :username, :address, :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email, :password, :password_confirmation, role_ids: []
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :username, :address, :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.semantic_errors
    if object.new_record? #new action
      f.inputs do
        f.input :username
        f.input :email
        f.input :address
        f.input :password
        f.input :password_confirmation
      end
    else  # update action
      f.inputs do
        f.input :username
        f.input :email
        f.input :address
        f.input :roles, as: :check_boxes
      end
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :username
    column :email
    column :roles
    column :created_at
    column :updated_at
    actions
  end

  filter :username
  filter :email
  filter :roles
  filter :created_at
  filter :updated_at
end
