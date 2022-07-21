blueprint: ## Generate all blueprints file
	@if ! type orbit >/dev/null 2>&1; then echo "Missing orbit dependency, please install from https://github.com/gulien/orbit/"; exit 1; fi
	orbit run generate

test-latest: test-8.0 ## Test the latest build only

_test-prerequisites: blueprint
	docker pull ubuntu:20.04

test-quick: _test-prerequisites ## Test 8.0 and 8.1 quickly
	PLATFORM=$$(uname -p) PHP_VERSION=8.0 BRANCH=v4 VARIANT=cli ./build-and-test.sh || (notify-send -u critical "Tests failed" && exit 1)
	PLATFORM=$$(uname -p) PHP_VERSION=8.1 BRANCH=v4 VARIANT=cli ./build-and-test.sh || (notify-send -u critical "Tests failed" && exit 1)
	notify-send -u critical "Tests passed with success"

test-8.1: _test-prerequisites ## Test php8.1 build only
	docker pull ubuntu:20.04
	PLATFORM=$$(uname -p) PHP_VERSION=8.1 BRANCH=v4 VARIANT=cli ./build-and-test.sh || (notify-send -u critical "Tests failed" && exit 1)
	PLATFORM=$$(uname -p) PHP_VERSION=8.1 BRANCH=v4 VARIANT=apache ./build-and-test.sh || (notify-send -u critical "Tests failed" && exit 1)
	notify-send -u critical "Tests passed with success"

test-8.0: _test-prerequisites ## Test php8.0 build only
	docker pull ubuntu:20.04
	PLATFORM=$$(uname -p) PHP_VERSION=8.0 BRANCH=v4 VARIANT=cli ./build-and-test.sh || (notify-send -u critical "Tests failed" && exit 1)
	PLATFORM=$$(uname -p) PHP_VERSION=8.0 BRANCH=v4 VARIANT=apache ./build-and-test.sh || (notify-send -u critical "Tests failed" && exit 1)
	notify-send -u critical "Tests passed with success"

clean: ## Clean dangles image after build
