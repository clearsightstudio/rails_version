# RailsVersion

This gem works with http://railsversion.herokuapp.com to track all of your Rails apps
and the versions they are running. This gives you one place to see all of your rails
application versions.

## Installation

As usual, add this line to your application's Gemfile and bundle afterward:

    gem 'rails_version', :group => :production, :git => "git://github.com/clearsightstudio/rails_version.git"

Get an account ID from http://railsversion.herokuapp.com, then go to your config/environments/production.rb file and add this:

    RailsVersion::Config.account_identifier = "MYACCOUNTID"

## Usage

You shouldn't have to do anything else!

## Code Climate

Version 0.1.0 Grade: A

[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/clearsightstudio/rails_version)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b feature/my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
