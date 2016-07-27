VENV = .venv
export VIRTUAL_ENV := $(abspath ${VENV})
export PATH := ${VIRTUAL_ENV}/bin:${PATH}

${VENV}:
	python3 -m venv $@

python-reqs: requirements.txt | ${VENV}
	pip install --upgrade -r $<

setup: python-reqs git-config | .git ${VENV}

start-jupyter:
	jupyter notebook
