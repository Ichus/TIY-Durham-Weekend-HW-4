json.(@user, :username)
json.page @entries.current_page
json.pages @entries.total_pages
json.prev api_v1_user_url(page: @entries.prev_page) unless @entries.first_page?
json.next api_v1_user_url(page: @entries.next_page) unless @entries.last_page?
json.books @entries do |entry|
  json.(entry, :title, :description, :post_date)
end
