# YieldStreet Project

* This project is accordance to meet the mvp requirements for the company to demonstrate where a person can see the listing of the offerings where one can invest the money.

* This system is purely built on Rails 5 API following the best Rails coding Standards.

* It's a complete Test Driven Development Project to assure the best delivery.


Things you may want to cover:

* Ruby version - 2.5.0
* System dependencies - rvm, linux, mysql
* Database creation - mysql
* How to run the test suite - rspec
* Rails version - 5.2.1


# Steps
* bundle install
* rails db:setup
* rails db:test:prepare
* rspec 
* bundle exec rspec spec/auth -fd  # for auth specs only

## View docs
* rails swagger:docs
* rails s
* Visit http://localhost:3000/api/v1/authentication.json 
* or find json docs inn public/api/v1/*

## Done
1. Application Setup
2. Architectural Level Things
3. Test Cases Defining
4. User Model Defining
5. Authentication (login/signup) Api Ready
6. Ruby Cop Followed for better code visibility

## Pending
1. Services Model Defining - Offerings
2. Owners Model Defining - prop
3. ServiceUsers Model Defining
4. ServiceDetails Model Defining
5. APIs of all the above mentioned models
6. Specs(Test Cases) for all the above models and requests API
7. Integrating Logging (bullet or something)
8. Integrating Sentry (Raven)   
9. Down the line 
    * using Decorators, 
    * Drapers, Services, 
    * Validators, 
    * Facades, 
    * Patterns (Services), 
    * Rake Tasks for db backup - Schedule, 
    * newRelic to track performance, 
    * Implementing Sidqkiq for BackgroundJobs	