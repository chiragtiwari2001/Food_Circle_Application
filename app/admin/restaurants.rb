ActiveAdmin.register Restaurant do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :restaurant_name, :restaurant_email, :restaurant_address, :restaurant_details, :restaurant_contact, :status, :restaurant_image, restaurant_categories_attributes: [:id, :category_id, :_destroy],
  restaurant_foods_attributes: [:id, :food_id, :_destroy]
  #
  # or
  #
  # permit_params do
  #   permitted = [:restaurant_name, :restaurant_email, :restaurant_address, :restaurant_details, :restaurant_contact, :status, :restaurant_image]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.semantic_errors
    f.inputs 'Restaurant Details' do
      f.input :restaurant_name
      f.input :restaurant_email
      f.input :restaurant_address
      f.input :restaurant_contact
      f.input :restaurant_details
      f.input :status
      f.input :restaurant_image, as: :file
    end
    f.inputs 'Restaurant Category' do
      f.has_many :restaurant_categories, allow_destroy: true do |rc| 
        rc.input :category, as: :select, collection: Category.all.collect { |c| [c.category_name, c.id] }
      end
    end
    f.inputs 'Restaurant Food' do
      f.has_many :restaurant_foods, allow_destroy: true do |rf|
        rf.input :food, as: :select, collection: Food.all.collect { |f| [f.food_name, f.id] }
      end
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :restaurant_name
    column :restaurant_email
    column :restaurant_contact
    column :restaurant_address
    actions
  end

  filter :restaurant_name
  filter :restaurant_email
  filter :restaurant_contact
  filter :categories, as: :select, collection: Category.all.collect { |c| [c.category_name, c.id] }
  filter :foods, as: :select, collection: Food.all.collect { |f| [f.food_name, f.id] }
  filter :created_at
  filter :updated_at
end
