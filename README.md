# silverspoon

silverspoon is for the developers who wants to start Rails5 app. With the very basic requirements likes devise, admin panel, bootstrap4 and many more. It provides the basic integration of gems which is essential to starts the development of an application.
like:- Devise authentication, Bootstrap4, active admin, exception notifier, letter opener, meta request, invite the users from admin panel.

In this application i implement the **STI for the app users.** Patron is my parent model with common devise modules.
* Admin: As name suggest admin controls the application, rather creating the users from admin panel sends the invitations to join the app.
* User: application users with invitable, registerable and confirmable devise modules.

This Rails 5 (5.0.0.1) app integrated:

* [Devise] - for authentication.

* [Active Admin] - for controlling the content of site through admin panel.

* [Devise invitable] - for inviting the user from the admin panel to join the application.

* [Bootstrap4] - for look and feel of application with glyphicons.

* [letter opener] - for view the content of email in the browser itself.

* [exception_notification] - for sending the exception email to recipients in production mode.

* Flash messages display.

* [meta_request]- for development (for google chrome [rails panel])

* .gitignore for rails app.

## Development environment:

* Ruby version (2.4).

* Rails 5 (5.0.0.1).

* Postgresql

## Setup

1. git clone the repo

```sh
$ git clone hhttps://github.com/nsocheleau/silverspoon.git
```
2. cd into that directory.

3. Setup the virtual machine using Vagrant

You' ll need to install VirtualBox and Vagrant first.

```sh
vagrant up
vagrant ssh
```

Once connected to the virtual machine
```sh
cd /vagrant
```
If you don't want to use a virtual machine, you'll need postgresql, a ruby version manager (RVM or rbenv) with ruby 2.4 on your machine.

4. Setup the rails project dependencies and run the rails server

```sh
bundle install
bundle exec rails db:create db:migrate db:seed
bundle exec rails s
```

Then browse to http://localhost:3000/ on the host

5. To run the tests
```sh
HEADLESS=true DISPLAY=:10 bundle exec rspec
```

Admin Panel [admin panel]

normal application [default]

## Live Demo

1. For Users [Heroku].

2. For Admins [HerokuAdminUrl]

#### Credentials to login as admin
```sh
Email: admin@example.com
Password: Welcome@123
```


   [Devise]: <https://github.com/plataformatec/devise>

   [Active Admin]: <https://github.com/activeadmin/activeadmin>

   [Devise invitable]: <https://github.com/scambra/devise_invitable>

   [Bootstrap4]: <http://v4-alpha.getbootstrap.com/>

   [letter opener]: <https://github.com/ryanb/letter_opener>

   [exception_notification]: <https://github.com/smartinez87/exception_notification>

   [meta_request]: <https://github.com/dejan/rails_panel/tree/master/meta_request>

   [rails panel]: <https://github.com/dejan/rails_panel>

   [admin panel]: <http://localhost:3000/admin/admins>

   [default]: <http://localhost:3000/users/sign_in>

   [Heroku]: <https://rails5-silverspoon.herokuapp.com/>

   [HerokuAdminUrl]: <https://rails5-silverspoon.herokuapp.com/admin/>
