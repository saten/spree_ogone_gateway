Fixed Quantity
==============

This is an extension for [Spree][1] 0.3.x, put together by [DefV][2]

This extension makes it possible to accept payments through [Ogone][3]. It requires the active\_merchant\_ogone gem to be installed on your system. Readme and test cases kindly provided by [Gorilla][4]

This extension has been ported to Rails3 by bzt.

Installation
------------

* Add gem 'ogone_gateway', :require => 'ogone_gateway', :git => 'git://github.com/bzt/spree_ogone_gateway.git' to your Gemfile
* Run 'bundle install'
* Go to the backend of your shop, and go to configuration > paying methods.
* Create a new paying method, and select 'Billing::Ogone' as the provider
* On the next screen, alter the valuta if needed, and fill in the Ogone passphrases and account name.
If you have not yet set up your SHA pass phrases:
Log in on Ogone, and go to Configuration > Technical information.
The SHA-IN can be set under 'Data and origin verification', the SHA-OUT under 'Transaction feedback'
You also need to check 'I want to receive transaction feedback parameters on the redirection URLs.' in the Transaction feedback tab.



[1]: http://spreecommerce.com/ "Spree: Open Source E-Commerce for Ruby on Rails"
[2]: http://workswithruby.com/ "Jan De Poorter's tech-blog about everything that is Ruby, Rails and programming in general."
[3]: http://www.ogone.com/ "Ogone Payment Services - Seamless & secure payment solutions"
[4]: http://www.gorilla-webdesign.be "Gorilla, webdesign uit Gent"