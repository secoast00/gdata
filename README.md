## Project GData
The project is basically a github user points app. It reads in data from an account and
 assigns points based on the activity. I've only just started the project but hope to
 add:

 * user specified accounts to import
 * the ability to save by project or user selected group
 * a graphical ui using AngularJS
 * user authentication
 * and of course, better tests and error checking

The idea for this project came from general reading I did a while ago and I can't
remember the article, blog, or repo.

## Setup
1. The app was developed with Ruby 2.1.1 & Rails 4.0.4. Please make sure you
   have them installed before continuing.
2. Clone the app to your local harddrive.
    git clone git@github.com:secoast00/gdata.git
3. From within the gdata directory, bundle the necessary gems.
    bundle install
4. Setup the database.
    bin/rake db:drop db:migrate db:test:prepare
5. Test the installation.
    bin/rake
6. Load the sample data.
    bin/rake data:import
7. Start the rails server.
    bin/rails s

You should now be able to access the app via http://localhost:3000

