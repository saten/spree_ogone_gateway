Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'ogone_gateway'
  s.version     = '0.0.1'
  s.summary     = 'Spree extension to send product recommendations to friends'
  #s.description = 'Add (optional) gem description here'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'DefV, gorilla, bzt'
  # s.email             = ''
  # s.homepage          = 'http://www.rubyonrails.org'
  # s.rubyforge_project = ''

  s.files        = Dir['CHANGELOG', 'README.md', 'LICENSE', 'lib/**/*', 'app/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'

  s.has_rdoc = true
  
  s.add_dependency('spree_core', '>= 0.30.0')
  s.add_dependency('active_merchant_ogone', '>= 0.2.0')

end
