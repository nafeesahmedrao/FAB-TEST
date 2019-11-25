# DSG-Task
A test Application showing most popular news,fetching JSON data from New York times REST API.

External Dependencies
Kingfisher

Installation and opening
Run pod install

Open NYTimes.xcworkspace in xcode

Run project in simulator or device of your choice

 Unit tests and code coverage 

You can run tests from command line with xcodebuild, out of the box. When you do so, you run all of the test cases 
contained in the test target you've selected.

Another approach

1 . Update target settings to run without a host app.

Select your project --> then test target --> Set the host application to none.

brew install xctool

xctool -workspace yourWorkspace.xcworkspace -scheme yourScheme run-tests -sdk iphonesimulator

Coverage report

$ xcodebuild -project XCCov-Demo.xcodeproj/ -scheme XCCov-Demo -derivedDataPath Build/ -destination 'platform=iOS Simulator,
OS=11.3,name=iPhone 7' -enableCodeCoverage YES clean build test CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO

View Report
$ xcrun xccov view Build/Logs/Test/*.xccovreport


