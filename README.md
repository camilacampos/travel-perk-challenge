# Travel Perk - Live Coding Inverview

This is a project ready to be developed on the TravelPerk live coding interview.

## Setup
### System requirements

| Dependency     | Version     |
| -------------- | ----------- |
| PostgreSQL     | **13.x**    |
| Docker         | **24.0.6**  |
| Docker-compose | **2.22.0**  |


### Running the application

To build the system, run: `make build`

Make sure the network changeme is created: `docker network create travel_perk`

To install and/or update dependencies, run: `make bundle-install`

To run the application, run: `make run`

To run a terminal attached with debug active (pry), run: `make run-debugging`

The project will be running on [http://localhost:7777/](http://localhost:7777/)

### Testing and linting

**Tests**
```bash
make test # run all tests
make test spec/path_to_spec.rb # run tests of an specific file
make test spec/path_to_spec.rb:34 # run test at an specific line of a file

make test-failures # run only previously failed tests
```

**Lint**
```bash
make lint # run lint
make lint-fix # run lint and automatically fix issues
```
