README WeBe Bloggin
-------------------------
Create a blog engine. Users need to be able to log in. Only logged in users can create, edit, or delete posts.


Posts are written in Markdown. They're displayed like on any blog -- reverse sequential order. They should be paginated, so if you have more than X posts -- 10 is a good number, so is 7, decide for yourself -- there are multiple pages, and some navigation at the bottom of the page to go to the previous or next set of posts.


Posts have a show view where you can just see that post. On the show view, there should be a comment form so you can leave comments. Comments should be shown on the page. Logged in users should be able to delete comments.

Use
-------------------------
run "git clone https://github.com/Ichus/TIY-Durham-Weekend-HW-4.git" in whichever directory you wish

run rake db:migrate

run rails server

In your browser navigate to "http://localhost:3000"

Assets
------------------------
Home page background image from "https://www.flickr.com/photos/webtreatsetc/4890262262/" under the creative common license "http://creativecommons.org/licenses/by/2.0/"

To Do
------------------------
Add slug url's

Add a side nav bar to see a User's posts by year/month

Add draft post's

Add remembering a commenter's name after first post. captcha's for sign up

API Use
------------------------
You can retrieve a page's information through the api directory

If you were viewing the webpage at localhost:3000/users/1
  Navigating to localhost:3000/api/users/1 would retrieve json

You can Create (POST), Update(PATCH/PUT), Destroy(DELETE) any type of Record(Users, Entries, Comments)
Example through curl "curl -X POST --data "comment[name]=Commenter&comment[description]=Description" http://localhost:3000/api/entries/9/comments"

You must be logged in/API key to Create Entries, or to Update or Delete any record.
