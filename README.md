 ## Pizza Ordering System

Please follow the following steps to setup and run the project.

1. Clone the project locally using SSH.
2. Move into the project directory and install the correct Ruby version using your Ruby package manager.This project is using the following versions:

   * Ruby version: 3.0.5
   * Rails version: 7.0.6

3. Install bundler using `gem install bundler`.
4. Run `bundle install`.
5. Run `./bin/create-db.sh` from project root.This will create, migrate and seed the DB. (You will need to give permissions to run this script using `chmod a+x bin/create-db.sh`)
6. Finally run `rails s` and open http://localhost:3000/ and you will see pizza orders web UI.


To run the system tests, run the following command in project root:
 * `rails test:system`
