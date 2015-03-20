Sesholder
=======

Seshook placeholder website

# Requirements

- Ruby 2.2
- MySQL `brew install mysql`

# Testing

```bash
RAILS_ENV=test rake db:migrate && rspec
```

# Docker

Install

- [docker-machine](https://docs.docker.com/machine/) `brew cask install docker-machine`
- [docker-compose](https://docs.docker.com/compose/) `brew install docker-compose`

```bash
docker-compose build app
docker-compose run app bundle exec rake db:migrate
docker-compose up
open http://$(docker-machine ip)
```

# Dump

```bash
mysql -h $(docker-machine ip) -u root -D sesholder -p

# Export emails to csv
echo 'select email from users' | mysql -B -h $(docker-machine ip) -u root -p sesholder > dump.csv
```

# Deployment

```bash
rake test:deploy    # Testing require vagrant
rake deploy
```
