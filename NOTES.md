What To Watch:

Build an MVC Sinatra Application.
Use ActiveRecord with Sinatra.
Use Multiple Models.
Use at least one has_many relationship
Must have user accounts. The user that created a given piece of content should be the only person who can modify that content
You should validate user input to ensure that bad data isn't created

1. Models:
  a. users
  b. shows
2. Controllers:
  a. ApplicationController
  b. UserController
  c. ShowController
3. Views:
  a. users
    1. signup.erb
    2. login.erb
  b. shows
    1. create_show.erb (add show to shows list)
    2. list_shows.erb (show all current_user's shows)
    3. edit_show.erb
    4. show_details.erb (individual show page with all show details)
  c. layout.erb
  d. index.erb
4. User has_many Shows
   Show belongs_to User
5. User validation:
  a. user must have username and password
  b. user can only edit their own show list
  c. user can only delete shows they created
  d. user can only edit shows they created
  e. user can only see shows when logged in
6. Show must have:
  a. title
  b. genre
  c. length


* Users can only see their own shows for now...
* Users will see their shows at '/shows'
