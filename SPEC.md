# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
-   # App was built with Sinatra
- [x] Use ActiveRecord for storing information in a database
-   # Uses ActiveRecord to store information about Users, Shows, Genres, and Lengths
- [x] Include more than one model class (list of model class names e.g. User, Post, Category)
-   # Models used: User, Shows, Genres, Lengths
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts)
-   # Genre has_many Shows, User has_many Shows, Length has_many Shows
- [x] Include user accounts
-   # User can create account and log in, and User accounts are saved in database
- [x] Ensure that users can't modify content created by other users
-   # User must be owner/creator of Show to edit/delete it
- [x] Include user input validations
-   # Users can't create blank shows
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new)
-   # Users receive flash messages when doing forbidden actions
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
-   # README contains description, install instructions, a contributors guide, and a link to the license.

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
