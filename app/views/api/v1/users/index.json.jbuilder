json.page @users.current_page
json.pages @users.total_pages
json.prev api_v1_users_url(page: @users.prev_page) unless @users.first_page?
json.next api_v1_users_url(page: @users.next_page) unless @users.last_page?
json.blogs @users do |user|
  json.username user.username
  json.blog "#{root_url}users/#{user.id}"
end
