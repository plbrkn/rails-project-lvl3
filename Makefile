test:
	bin/rails test

setup:
	cp -n .env.example .env || true
	bin/setup
	bin/rails db:fixtures:load

install:
	yarn install
	bundle install

start:
	heroku local -p 3000

lint: lint-code

lint-code:
	bundle exec rubocop
	bundle exec slim-lint app/views/

linter-code-fix:
	bundle exec rubocop -A

deploy:
	git push heroku main

heroku-console:
	heroku run rails console

heroku-logs:
	heroku logs --tail

check: lint test

server:
	bin/rails server

.PHONY: test
