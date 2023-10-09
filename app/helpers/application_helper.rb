module ApplicationHelper
  def full_title(page_title = '')
    base_title = 'Food Vault'
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end

  def is_admin?
    current_user.has_role? :admin
  end

  def set_admin
    outlet = Restaurant.find_by(params[:id])
    return unless current_user.email == outlet.restaurant_email

    current_user.add_role :admin
  end

  def set_cart
    user_cart = if current_user.cart.present?
                  current_user.cart
                else
                  Cart.create(restaurant_id: params[:restaurant_id], user: current_user)
                end
  end

  def cart_item_exist?(food)
    cart_item = set_cart.cart_items.find_by(food:)
    cart_item.present?
  end

  def update_cart
    set_cart.cart_items.update(quantity:)
  end

  def correct_admin_for_restaurant
    return unless is_admin?

    outlet = Restaurant.find(params[:id])

    return if current_user.email == outlet.restaurant_email

    flash[:danger] = 'you dont have access to this restaurant'
    redirect_to restaurants_path
  end
end
