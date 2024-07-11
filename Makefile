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

.PHONY: build
build:
	python setup.py sdist bdist_wheel

.PHONY: development_build
development_build: clean_build
	pipx run build
# python -m twine upload --skip-existing --repository-url https://us-python.pkg.dev/clover-sre-001/clover-production/ dist/*

.PHONY: clean_build
clean_build:
	rm -rf build/
	rm -rf dist/
	rm -rf *.egg*/
	find . -type d -name '.func' -delete
