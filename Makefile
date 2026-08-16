.PHONY: clean build-android-appbundle-dev build-android-appbundle-prod build-android-apk-dev build-android-apk-prod build-linux build-windows build-macos

BUILD_NUMBER = $(shell git rev-list --count HEAD)
BUILD_ARGS = --no-tree-shake-icons

ifneq ($(SUPABASE_URL),)
BUILD_ARGS += --dart-define=SUPABASE_URL=$(SUPABASE_URL)
endif

ifneq ($(SUPABASE_ANON_KEY),)
BUILD_ARGS += --dart-define=SUPABASE_ANON_KEY=$(SUPABASE_ANON_KEY)
endif

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
	flutter config --enable-linux-desktop
	@if [ ! -d linux ]; then flutter create --platforms=linux .; fi
	flutter build linux --release $(BUILD_ARGS)

build-windows:
	flutter create --platforms=windows .
	flutter build windows --release $(BUILD_ARGS)

build-macos:
	flutter create --platforms=macos .
	flutter build macos --release $(BUILD_ARGS)

pub-get:
	flutter pub get

format: pub-get
	dart format .

format-check: pub-get
	dart format --set-exit-if-changed .