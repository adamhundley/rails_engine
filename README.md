[![Build Status](https://travis-ci.org/adamhundley/rails_engine.svg?branch=master)](https://travis-ci.org/adamhundley/rails_engine)
[![Stories in Ready](https://badge.waffle.io/adamhundley/rails_engine.png?label=ready&title=Ready)](https://waffle.io/adamhundley/rails_engine)

## Rails Engine

[Rails Engine](https://github.com/turingschool/lesson_plans/blob/master/ruby_03-professional_rails_applications/rails_engine.md#invoices) is a JSON API built with Ruby on Rails and Active Record.  There are a variety of endpoints on Etsy merchant and customer data.

Please run the following commands in order to run the API locally on your machine.
```
    git clone git@github.com:adamhundley/rails_engine.git
    cd rails_engine
    bundle
    rake db:create db:migrate
    rake db:load_csv
```
* Run the test suite with the command `rspec`

* Fire up the server locally with the command `rails s`

* Navigate to `localhost:3000/api/v1/:endpoint` on your browser

To run the spec harness do the following
```
    git clone git@github.com:turingschool/rales_engine_spec_harness.git
    cd rales_engine_spec_harness
    bundle exec rake
```
### Record Endpoints
```
  \merchants
  \customers
  \items
  \invoices
  \invoice_items
  \transactions
```
#### Index of Record

Each data category includes an `index` action which
renders a JSON representation of all the appropriate records:

`GET /api/v1/merchants.json`

#### Show Record

Each data includes a `show` action which
renders a JSON representation of the appropriate record:

`GET /api/v1/merchants/1.json`

#### Single Finders

Each data category offers `find` finders to return a single object representation like this:

```
GET /api/v1/merchants/find?id=12
```

Which would find the one merchant with ID `12`. The finder should work with any of the attributes defined on the data type and always be case insensitive.

For example:

```
GET /api/v1/merchants/find?name=Schroeder-Jerde
```

#### Multi-Finders

Each category offers `find_all` finders like this:

```
GET /api/v1/merchants/find_all?name=Cummings-Thiel
```

Which would find all the merchants whose name matches this query.

The finder works with any of the attributes defined on the data type and always be case insensitive.

#### Random

`api/v1/merchants/random.json` returns a random merchant.

### Relationship Endpoints

#### Merchants

* `GET /api/v1/merchants/:id/items` returns a collection of items associated with that merchant
* `GET /api/v1/merchants/:id/invoices` returns a collection of invoices associated with that merchant from their known orders

#### Invoices

* `GET /api/v1/invoices/:id/transactions` returns a collection of associated transactions
* `GET /api/v1/invoices/:id/invoice_items` returns a collection of associated invoice items
* `GET /api/v1/invoices/:id/items` returns a collection of associated items
* `GET /api/v1/invoices/:id/customer` returns the associated customer
* `GET /api/v1/invoices/:id/merchant` returns the associated merchant

#### Invoice Items

* `GET /api/v1/invoice_items/:id/invoice` returns the associated invoice
* `GET /api/v1/invoice_items/:id/item` returns the associated item

#### Items

* `GET /api/v1/items/:id/invoice_items` returns a collection of associated invoice items
* `GET /api/v1/items/:id/merchant` returns the associated merchant

#### Transactions

* `GET /api/v1/transactions/:id/invoice` returns the associated invoice

#### Customers

* `GET /api/v1/customers/:id/invoices` returns a collection of associated invoices
* `GET /api/v1/customers/:id/transactions` returns a collection of associated transactions

### Business Intelligence Endpoints

#### All Merchants

* `GET /api/v1/merchants/most_revenue?quantity=x` returns the top `x` merchants ranked by total revenue
* `GET /api/v1/merchants/most_items?quantity=x` returns the top `x` merchants ranked by total number of items sold
* `GET /api/v1/merchants/revenue?date=x` returns the total revenue for date `x` across all merchants

#### Single Merchant

* `GET /api/v1/merchants/:id/revenue` returns the total revenue for that merchant across all transactions
* `GET /api/v1/merchants/:id/revenue?date=x` returns the total revenue for that merchant for a specific invoice date `x`
* `GET /api/v1/merchants/:id/favorite_customer` returns the customer who has conducted the most total number of successful transactions.
* `GET /api/v1/merchants/:id/customers_with_pending_invoices` returns a collection of customers which have pending (unpaid) invoices

#### Items

* `GET /api/v1/items/most_revenue?quantity=x` returns the top `x` items ranked by total revenue generated
* `GET /api/v1/items/most_items?quantity=x` returns the top `x` item instances ranked by total number sold
* `GET /api/v1/items/:id/best_day` returns the date with the most sales for the given item using the invoice date

#### Customers

* `GET /api/v1/customers/:id/favorite_merchant` returns a merchant where the customer has conducted the most successful transactions
