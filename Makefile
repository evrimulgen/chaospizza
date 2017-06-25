help:
	@echo "web-application development environment"
	@echo "--------------------------------------------------------------------------------"
	@echo ""
	@echo "Install pip dependencies:"
	@echo "    make install"
	@echo ""
	@echo "Linters will make you cry if you add shitty code:"
	@echo "    make lint"
	@echo ""
	@echo "Tests ensure your code actually works (if you dont screw up the tests):"
	@echo "    make test"
	@echo ""
	@echo "Run development server when linters and tests are good":
	@echo "    make run"
	@echo ""
	@echo "Open REPL with Django:"
	@echo "    make repl"
	@echo ""
	@echo "Remove pycache:"
	@echo "    make clean"
	@echo ""

install:
	pip install -r requirements/dev.txt

lint:
	pylint chaospizza/ config/
	export MYPYPATH=$PWD/mypy
	mypy --ignore-missing-imports --strict-optional chaospizza/ config/
	pycodestyle chaospizza/ config/
	pydocstyle chaospizza/ config/

test: lint
	pytest

migrate: test
	python ./manage.py migrate

run: migrate
	python ./manage.py runserver

repl:
	python ./manage.py shell

clean:
	-find src -name '__pycache__' -exec rm -r "{}" \; 2>/dev/null

.PHONY: install lint migrate run repl clean