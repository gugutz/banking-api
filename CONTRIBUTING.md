# Contributing to packages_bot
First off, thanks for taking the time to contribute!

Now, take a moment to be sure your contributions make sense to everyone else.
These are just guidelines, not rules.
Use your best judgment, and feel free to propose changes to this document in a pull request.

## Reporting Issues
Found a problem? Want a new feature? First of all see if your issue or idea has [already been reported](https://github.com/gugutz/bank-api/issues).
If don't, just open a [new clear and descriptive issue](https://github.com/gugutz/bank-api/issues/new).

## Submitting pull requests
Pull requests are the greatest contributions, so be sure they are focused in scope, and do avoid unrelated commits.
And submit your pull request after making sure that all tests pass and they are covering 100% of the code.

- Fork it!
- Clone your fork: `git clone https://github.com/<your-username>/bank-api
- Navigate to the newly cloned directory: `cd bank-api`
- Install the tools necessary for development: `bundle install`
- Create a new branch for the new feature: `git checkout -b my-new-feature`
- Make your changes.
- Commit your changes: `git commit -am 'Add some feature'`
- Push to the branch: `git push origin my-new-feature`
- Submit a pull request with full remarks documenting your changes.

## Running locally
To install and run the bot locally:

- Clone the repo: `git clone https://github.com/gugutz/bank-api`
- Navigate to the newly cloned directory: `cd bank-api`
- Run `docker-compose up` to mount the database instance
- Run `bundle install`
- Run `rails s` to run the API

