module ApplicationHelper
  def full_title(page_title = '')
    base_title = "Food Vault"
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end

  def is_admin?
    current_user.has_role? :admin
  end

  def set_cart
    if current_user.cart.present?
      user_cart = current_user.cart
    else
      user_cart = Cart.create(restaurant_id: params[:restaurant_id], user: current_user)
    end
  end

  def cart_item_exist?(food)
    cart_item = set_cart.cart_items.find_by(food: food)
    cart_item.present?
  end

  def update_cart
    set_cart.cart_items.update(quantity: quantity)
  end
end
