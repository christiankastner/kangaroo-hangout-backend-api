# Kangaroo-Hangout-Backend-API

Flatiron School Module 4 Project Backend by [Christian Kastner](https://github.com/ckastner12)

Kangaroo Hangout is an app designed to allow users to plan events that contain several activities supplied by the Google Places API. The users can create and login to profiles and create planned events that they want to schedule. Wanna find the closest thai food restaurant to your ballroom dancing class? It's easy with kangaroo hangout

## Installation

Run 'bundle install' to install required gems. The additional gem 'pg' for the PostgreSQL was used as well as uncommenting 'rack-cors' from the given gem suite in Rails.

```bash
bundle install
```

Run 'rails db:migrate' in the root directory to create the database locally. Feel free to run 'rails db:seed to get some starter poems'

```bash
rails db:migrate
rails db:seed
```

Don't forget to start up your rails server with 'rails s'

```bash
rails s -p 3001
```

The number trailing the server start call is very important as frontend fetch calls are set to this routing address

Enjoy hanging out and planning your next adventure

## Contributing

Contributions are welcome. Feel free to open a pull request or branch from this project. Make it your own!

## License

[MIT](https://choosealicense.com/licenses/mit/)
