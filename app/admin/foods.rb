ActiveAdmin.register Food do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :category_id, :food_name, :price
  #
  # or
  #
  # permit_params do
  #   permitted = [:category_id, :food_name, :price]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :category, as: :select, collection: Category.all.collect { |c| [ c.category_name, c.id ] }
      f.input :food_name
      f.input :price
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :food_name
    column 'Category' do |food|
      link_to food.category.category_name, admin_category_path(food.category)
    end
    column :price
    column :created_at
    column :updated_at
    actions
  end

  filter :food_name
  filter :price
  filter :category, as: :select, collection: Category.all.collect { |c| [c.category_name, c.id] }
  filter :created_at
  filter :updated_at
end
