# Solution Interview two-way-messaging: Hans Lauwers

## Installing

These are the steps required to get started.

```
bundle install
bundle exec rake db:migrate
bundle exec rake db:seed
```

This should install all the gems, execute the database migrations and fill the database with some sample data.

## Running the tests

Tests are added for the main methods in conversations\_controller.rb.
The code for the tests is found in _'spec/controllers/conversations\_controller_spec.rb'_

Make sure that the database-environment is set to test by running. If you're not sure, run this command.

```
bin/rails db:environment:set RAILS_ENV=test
```

To run the test, run the rspec command in the console.

```
rspec -f d --color
```
