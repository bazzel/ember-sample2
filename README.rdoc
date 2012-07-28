# Very Simple CRUD Using Ember.js

This application is just a personal exercise to get familiar with [ember.js](http://emberjs.com/) and it's based on the [Ember Application Structure](http://emberjs.com/guides/outlets/) on the ember.js site.

The application shows a table of Post objects which you can edit and show. It's also possible to create new Post objects.
Every Post contain 0 or more Comments and Backtracks which are visible on the show page to play with ember's nested routes.

The application uses a Rails 3.2.x back-end and contains a generator to get you up and running.

# Getting Started
1. Clone this repo
 `git clone https://github.com/bazzel/ember-sample2.git very_simple_crud`
2. Navigate to the application directory
 `cd very_simple_crud`
3. Install the gems
 `bundle install`
4. Create the (SQLite) database
 `rake db:create`
5. Run the migrations
 `rake db:migrate`
6. Populate the database
 `rake db:seed`
7. Start the server
 `rails s`
8. Open a browser and navigate to http://localhost:3000
