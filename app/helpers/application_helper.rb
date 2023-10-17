module ApplicationHelper
  def full_title(page_title = '')
    base_title = 'Food Vault'
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end

  def admin?
    current_user.has_role? :admin
  end

  def set_cart
    if current_user.cart.present?
      current_user.cart
    else
      Cart.create(restaurant_id: params[:restaurant_id], user: current_user)
    end
  end

  def cart_item_exist?(food)
    cart_item = set_cart.cart_items.find_by(food:)
    cart_item.present?
  end
end
