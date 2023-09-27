module ApplicationHelper
  def full_title(page_title = '')
    base_title = "Food Vault"
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end
end