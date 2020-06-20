.PHONY: build
build:
	swift package generate-xcodeproj
	xcodebuild -sdk iphonesimulator