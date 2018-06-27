## Users API
Users API is a project to create, list, update, destroy and activate users.

### System requirements:
* Ruby version 2.5.1
* Rails version 5.2.0

### Installation

Clone the project:
`$ git clone https://github.com/LuizaMagalhaes/bank-api.git`

Run:
`$ bundle install`

To run the suite of test : `$ rspec`

To create a Database: `$ rails db:create`

To run the migrations: `$ rails db:migrate`

The Account have the following params:
* name;
* balance;

The Transference have the following params:
* amount;
* account_source_id;
* acoount_destination_id;

### ENDPOINTS:
`GET  "/accounts"` => Accounts list

`GET "/account/:id"` => View account infos by id

`POST "/transference"` => Create a new transference

`GET "/transference/:id"` => View a transference infos by id
  