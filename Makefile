test:
	bin/rails test

setup:
	bin/setup
	bin/rails db:fixtures:load

start:
	heroku local -p 3000

lint: lint-code lint-style

lint-code:
	bundle exec rubocop
	bundle exec slim-lint app/views/

lint-style:
	npx stylelint "**/*.scss" "!**/vendor/**"

linter-code-fix:
	bundle exec rubocop -A

deploy:
	git push heroku main

heroku-console:
	heroku run rails console

heroku-logs:
	heroku logs --tail

check: lint test

.PHONY: test
