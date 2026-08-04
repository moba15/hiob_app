.PHONY: clean build-android-appbundle-dev build-android-appbundle-prod build-android-apk-dev build-android-apk-prod build-linux build-windows build-macos

BUILD_NUMBER = $(shell git rev-list --count HEAD)
BUILD_ARGS = --no-tree-shake-icons
clean:
	flutter clean

build-android-appbundle-dev:
	flutter build appbundle --flavor dev --build-number=$(BUILD_NUMBER) $(BUILD_ARGS)

build-android-appbundle-prod:
	flutter build appbundle --flavor prod --build-number=$(BUILD_NUMBER) $(BUILD_ARGS)

build-android-apk-dev:
	flutter build apk --flavor dev --build-number=$(BUILD_NUMBER) $(BUILD_ARGS)

build-android-apk-prod:
	flutter build apk --flavor prod --build-number=$(BUILD_NUMBER) $(BUILD_ARGS)

build-linux:
	flutter create --platforms=linux .
	flutter build linux --release

build-windows:
	flutter create --platforms=windows .
	flutter build windows --release

build-macos:
	flutter create --platforms=macos .
	flutter build macos --release

pub-get:
	flutter pub get

format: pub-get
	dart format .

format-check: pub-get
	dart format --set-exit-if-changed .