json.(@entry, :title, :description, :post_date)
if @entry_comments
  json.page @entry_comments.current_page
  json.pages @entry_comments.total_pages
  json.prev api_v1_entry_url(page: @entry_comments.prev_page) unless @entry_comments.first_page?
  json.next api_v1_entry_url(page: @entry_comments.next_page) unless @entry_comments.last_page?
end
json.books @entry_comments do |comment|
  json.(comment, :name, :description, :post_date)
end
