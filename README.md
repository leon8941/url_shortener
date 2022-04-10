# CoinGecko Url Shortener

## Introduction

A URL Shortener service, similar to [bit.ly](https://bitly.com/) and [tinyurl.com](https://tinyurl.com/) is a service that maps a short-form URL \(_"Short URL"_\) to a user-provided target URL \(_"Target URL"_\).

Production apps can be found [here](https://coingecko-url-shortener-rails.herokuapp.com/).

## Installations and Setup

Get the codebase from source control:

1. Go to [this](https://github.com/leon8941/url_shortener) Github Repo, copy the remote url and run the following git command:
   -  `git clone https://github.com/leon8941/url_shortener.git`
   -  `git remote add origin https://github.com/leon8941/url_shortener.git`
   -  `git checkout main`
2. Make sure you are in the project root directory:
   - `bundle install`
3. After install all the gems dependencies, start the server:
   - `rails server`

   The application should be running in localhost port 3000, go to http://localhost:3000/ in your prefer browser.
   

## Testing

Run the command `rake` for the test. The test cases are:
- `rails test test/controllers/urls_controller_test.rb`
- `rails test test/integration/user_flow_test.rb`
- `rails test test/models/url_test.rb`
- `rails test test/models/url_tags_test.rb`
- `rails test test/models/user_test.rb`

## Merge PR and deployment

Pushes PR in to `main` branch trigger deployment process to production.
- Create a branch from master.
- One commit per branch unless its a feature branch.
- Create a PR with the following template:
```
[TITLE OF THE CHANGES]
WHY:
# State the reason and intention of the changes
WHAT:
# Briefly state the steps and the ideology of the changes.
```
- After getting approvals, proceed to merge to `main` branch. Observe the test results from the CI/CD pipeline.
