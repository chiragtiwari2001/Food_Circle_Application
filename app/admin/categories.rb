ActiveAdmin.register Category do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :category_name, :category_image
  #
  # or
  #
  # permit_params do
  #   permitted = [:category_name, :category_image]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.inputs 'Category Details' do
      f.input :category_name
      f.input :category_image, as: :file
    end
  end

  index do
    selectable_column
    id_column
    column :category_name
    column :category_image
    column :created_at
    column :updated_at
    actions
  end

  filter :category_name
  filter :created_at
  filter :updated_at
end
