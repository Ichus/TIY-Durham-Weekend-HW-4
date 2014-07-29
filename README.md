README WeBe Bloggin
-------------------------
- Create a blog engine. Users need to be able to log in. Only logged in users can create, edit, or delete posts.


- Posts are written in Markdown. They're displayed like on any blog -- reverse sequential order. They should be paginated, so if you have more than X posts -- 10 is a good number, so is 7, decide for yourself -- there are multiple pages, and some navigation at the bottom of the page to go to the previous or next set of posts.


- Posts have a show view where you can just see that post. On the show view, there should be a comment form so you can leave comments. Comments should be shown on the page. Logged in users should be able to delete comments.

Use
-------------------------
- With Ruby and Rails both installed

- run "git clone https://github.com/Ichus/TIY-Durham-Weekend-HW-4.git" in whichever directory you wish

- cd into the cloned directory

- run rake db:migrate

- run rails server

- In your browser navigate to "http://localhost:3000"

Assets
------------------------
- Background image from "https://www.flickr.com/photos/webtreatsetc/4890262262/" 
    - under the creative common license "http://creativecommons.org/licenses/by/2.0/"

To Do
------------------------
- Add slug url's

- Add a side nav bar to see a User's posts by year/month

- Add draft post's

- Add remembering a commenter's name after first post

- Add captcha's for sign up

API Use
------------------------
- You can retrieve a page's information through the api directory

- If you were viewing the webpage at localhost:3000/users/1
   - Navigating to "localhost:3000/api/users/1" would retrieve json

- You can Create (POST), Update(PATCH/PUT), Destroy(DELETE) any type of Resource(Users, Entries, Comments)
    - Example through curl
        - "curl -X POST --data "comment[name]=Commenter&comment[description]=Description" http://localhost:3000/api/entries/:id/comments"

- You must pass the API key as a parameter to Create Entries, or to Update or Delete any record.
    - To retrieve your API token. Log in and click the link "API Token" in the top nav bar.
    - Example 
        - "curl -X PATCH --data "comment[name]=Commenter&comment[description]=Updated Description&api_token=Your API token here" http://localhost:3000/api/comments/:id"
        - "curl -X DELETE --data "api_token=Your API token here" http://localhost:3000/api/entries/:id"
        - "curl -X POST --data "entry[title]=API Made Post&entry[description]=API Made Description&api_token=Your API token here" http://localhost:3000/api/entries"

**Valid API endpoints**
   
| User Endpoints                               | Action           |
| :------------------------------------------- | :--------------: |
| localhost:3000/api/users                     | All Users        |
| localhost:3000/api/users/:id                 | Individual User  |
| POST localhost:3000/api/users                | Create a User    |
| PATCH localhost:3000/api/users/:id           | Update a User    |
| DELETE localhost:3000/api/users/:id          | Delete a User    |

| Blog Endpoints                               | Action           |
| :------------------------------------------- | :--------------: |
| localhost:3000/api/entries/:id               | Individual Blog  |
| POST localhost:3000/api/entries              | Create a Blog    |
| PATCH localhost:3000/api/entries/:id         | Update a Blog    |
| DELETE localhost:3000/api/entries/:id        | Delete a Blog    |
    
| Comment Endpoints                            | Action           |
| :------------------------------------------- | :--------------: |
| POST localhost:3000/api/entries/:id/comments | Create a Comment |
| PATCH localhost:3000/api/comments/:id        | Update a Comment |
| DELETE localhost:3000/api/comments/:id       | Delete a Comment |
