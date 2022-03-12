# Senior Rails technical test

## Summary

Welcome here! To achieve this mission, you'll have some tasks. Try your best, this should take you less than 2-3 hours. Please read this entire document before starting to work. :-)

## What's important for us?

* Clarity
* Security
* Scalability
* Creativity

# The test

## Base

5 models are created. Here is a description of their organization. An **establishement** has a single physical **address** and can have several **events**. 
A **user** is the entry point and can be a **manager** (or a guest but not managed here). 
When you need to answer a question or justify a decision, just add it on this document at the correct place. 

## Models

Missing part : 
1. Each **establishment** can have several **managers**. 
2. Add seeds to populate as fast as possible the database with at least 100 entries for each model.

What do you think about created models? Are they __safe__? How can you test it better, if you can?

* _Depending on what kind of information the `Manager` model is going to hold in the future (right now only has a reference to the `User`), I'd chosen to use a 'role' attribute (or something similar) on the `User` model and create a scope within the `Establishment` to facilitate quering for it. This simplifies the schema, and the associations between models._

* _There is no validation on the actual attributes (i.e. email or phone number format), allowing to have multiple ways to save the information in the database which can be a problem in the future._

* _Since the actual models only contain associations (and no logic or custom methods) there is nothing else to test besides that._

## Controller

There is a single endpoint to:
* Create a user 
* Create an establishment
* Create an address
* Assocaite a user to an establishment
* Associate an address to an establishment

This is handle by a service. Is it __safe__? Improve it. Same for the tests. 

_This enpoint is not safe considering:_
* _There is no authentication check on the endpoint_
* _There is no CSRF check on the controller_

_This means that everyone that knows how to access it, could create Establishments, Users, Addresses._

## Queries

Find ActiveRecord queries for the following cases:

* Establishments with at least one event validated
* Establishments with finished events not `pending`
* Events linked to an establishment with at least 3 managers

# Commits

It's suggested to make a commit on every important step of your work. Commits must follow the [conventional commits](https://www.conventionalcommits.org/en/v1.0.0-beta.4/#summary) rules.

# Final push

Create a branch and push your code on it. 


# Rendering

Your code will be checked out and the command will be ran:

* Testing :  `bin/rspec spec` 
* AR queries : `rails runner lib/ar_queries.rb`


# Next steps

When code is reviewed, you'll have another interview so you can explain why you made those choices, what you'd have done if you had more time etc. 