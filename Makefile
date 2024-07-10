OS = $(shell uname -s)

PIP_EXTRA_INDEX_URL=

BREW_PACKAGES := pipx
.PHONY: setup
setup: mac_dependencies pipenv

.PHONY: mac_dependencies
mac_dependencies:
ifeq (${OS}, Darwin)
	brew update
	brew install $(BREW_PACKAGES) 2> /dev/null || true
	brew upgrade $(BREW_PACKAGES) 2> /dev/null || true
endif

.PHONY: pipenv
pipenv:
	pipx install pipenv
	pipenv install
# Check if pipenv virtual environment is activated
	@if [ -z "$$VIRTUAL_ENV" ]; then \
		echo "Virtual environment not activated. Activating pipenv shell..."; \
		pipenv shell; \
	else \
		echo "Virtual environment is already activated."; \
	fi

.PHONY: test
test:
	tox

.PHONY: lock
lock:
	pipenv lock
