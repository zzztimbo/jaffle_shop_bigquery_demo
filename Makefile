.DEFAULT_GOAL := help

setup: ## Install dependencies
	pip install dbt-postgres

start: ## Start the server
	docker-compose -f ./warehouse/docker-compose.yml up -d

run: ## Run the server
	dbt build --profiles-dir ./profiles

go: ## Runs all initialization commands
	make setup
	make start
	make run

cleanup: ## Clean up
	docker-compose -f ./warehouse/docker-compose.yml down
	docker-compose -f ./warehouse/docker-compose.yml rm
	dbt clean

.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'