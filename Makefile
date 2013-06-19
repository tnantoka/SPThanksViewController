test:
	xcodebuild \
		-sdk iphonesimulator \
		-workspace SPThanksViewController.xcworkspace \
		-scheme SPThanksViewControllerLogicTests \
		-configuration Debug \
		clean build \
		ONLY_ACTIVE_ARCH=NO \
		TEST_AFTER_BUILD=YES \

