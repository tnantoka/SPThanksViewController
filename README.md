# SPThanksViewController

[![Build Status](https://travis-ci.org/tnantoka/SPThanksViewController.png?branch=master)](https://travis-ci.org/tnantoka/SPThanksViewController)

Special thanks view with podfile-info.

![](http://tobioka.net/wp-content/uploads/2013/06/SPThanksViewController_phone1.png)

![](http://tobioka.net/wp-content/uploads/2013/06/SPThanksViewController_phone2.png)

![](http://tobioka.net/wp-content/uploads/2013/06/SPThanksViewController_pad.png)

## Requirement
* iOS 5+
* ARC

## How to Use

### Install
    # Podfile
    pod 'SPThanksViewController', git: 'https://github.com/tnantoka/SPThanksViewController.git'
    
    $ pod install

### Add podfile-info to your project
    # Create
	$ pod podfile-info --all --md > podfile-info.md
    # Add 'podfile-info.md' to project.
	
	# Update
	$ pod podfile-info --all --md > path/to/podfile-info.md
	
### Code
    #import "SPThanksViewController.h"

	// Modal
    SPThanksViewController *thanksController = SPThanksViewController.new;
    [self presentViewController:thanksController.navController animated:YES completion:nil];

    // Push
    SPThanksViewController *thanksController = SPThanksViewController.new;
    [self.navigationController pushViewController:thanksController animated:YES];

&copy; 2013 [tnantoka](https://twitter.com/tnantoka)


