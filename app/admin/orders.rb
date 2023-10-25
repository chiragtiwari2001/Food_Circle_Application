# frozen_string_literal: true

ActiveAdmin.register Order do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :user_id, :restaurant_id, :total_amount, :order_status
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :restaurant_id, :total_amount, :order_status]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  # form do |f|
  #   if object.new_record?
  #     f.inputs do
  #       f.input :user
  #       f.input :restaurant, as: :select, collection: Restaurant.all.collect { 
  #         |r| [r.restaurant_name, r.id] }
  #       f.input :total_amount

  #       f.inputs 'Food ordered' do
  #         f.has_many :order_items, allow_destroy: true do |item|
  #           item.input :food, as: :select, collection: Food.all.collect { |f| [f.food_name, f.id] }
  #         end
  #       end
  #     end
  #   else
  #     f.inputs do
  #     end
  #   end
  #   f.actions
  # end

  index do
    selectable_column
    id_column
    column :user
    column 'Restaurant' do |order|
      link_to order.restaurant.restaurant_name, admin_restaurant_path(order.restaurant)
    end
    column :order_status
    column 'Foods' do |order|
      order.foods.map(&:food_name).join(', ')
    end
    column :total_amount
    column :created_at
    column :updated_at
    actions
  end

  filter :order_status, as: :check_boxes, collection: Order.order_statuses
  filter :total_amount
  filter :foods, as: :select, collection: Food.all.collect {|f| [f.food_name, f.id]}
  filter :created_at
  filter :updated_at
end
