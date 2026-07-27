# devop-test
Simple Rails API that needs some devop stuff on it.

## Stack
- Ruby 3.3.6
- Rails 7.1
- PostgreSQL
- Puma

## Local setup
1. Install Ruby 3.3.6 (use your version manager of choice, e.g. `rbenv install 3.3.6`).
2. Install the dependencies: `$ bundle install`
3. Ensure PostgreSQL is running and reachable on port 5432.
4. Setup development & test DBs: `$ bin/rails db:setup`
5. Fill with some data: `$ bin/rails db:seed`

## Development
1. Ensure the db is running on port 5432.
2. Start the app: `$ bin/rails s`
3. Liveness check: `$ curl -v http://localhost:3000/ping; echo`
4. Readiness check (verifies DB connectivity): `$ curl -v http://localhost:3000/status; echo`

## Endpoints
- `GET /ping` — returns a sample response (liveness).
- `GET /status` — returns `{ "status": "ok", "database": "connected" }` when the app
  can reach the database (readiness). Returns HTTP 503 otherwise.

## Test
1. Ensure the db is running on port 5432.
2. `$ bundle exec rspec`

## Check code styling/linting
`$ bundle exec rubocop`

### Notes
> Database credentials are set in config/database.yml, but
> Rails can also take the db connection string from the DATABASE_URL env variable.
