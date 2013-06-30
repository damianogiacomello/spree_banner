SpreeBanner
===================

Add banner for Spree Commerce Shop [compatible with Amazon S3]


Basic Installation
------------------

1. Add the following to your Gemfile
<pre>
  gem 'spree_banner', '~> 2.0.0'
</pre>
2. Run `bundle install`
3. To copy and apply migrations run:
<pre>
	rails g spree_banner:install
</pre>

Example
=======

1. add banner helper method in your view:
<pre>
	<%= insert_banner_box(:category => "my_category") %>
</pre>
and add banner in the admin section
2. Additional options:
<pre>
	:class => "my_class"
	:style => "my_style"
	:list = true|false
</pre>

Copyright (c) 2012 [Damiano Giacomello], released under the New BSD License
