# 
# To change this template, choose Tools | Templates
# and open the template in the editor.
 

require 'rubygems'
require 'rake'
require 'rake/clean'
require 'rake/gempackagetask'
require 'rake/rdoctask'
require 'rake/testtask'

spec = Gem::Specification.new do |s|
  s.name = %q{method_finder}
  s.version = "0.0.1"
  s.authors = ["Fabricio Nascimento"]
  s.date = %q{2009-03-09}
  s.description = %q{Method_Finder is a clone for the MethodFinder functionality of Smaltalk.}
  s.email = ["fabriciosn@gmail.com"]
  s.files = ["method_finder.gemspec","lib/method_finder.rb"]
  s.require_paths = ["lib"]
  s.has_rdoc = true
  s.extra_rdoc_files = ["README"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Method_Finder is a clone for the MethodFinder functionality of Smaltalk.}
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.need_tar = true
  pkg.need_zip = true
end

Rake::GemPackageTask.new(spec) do |p|
  p.gem_spec = spec
  p.need_tar = true
  p.need_zip = true
end

Rake::RDocTask.new do |rdoc|
  files =['README', 'LICENSE', 'lib/**/*.rb']
  rdoc.rdoc_files.add(files)
  rdoc.main = "README" # page to start on
  rdoc.title = "m_f Docs"
  rdoc.rdoc_dir = 'doc/rdoc' # rdoc output folder
  rdoc.options << '--line-numbers'
end

Rake::TestTask.new do |t|
  t.test_files = FileList['test/**/*.rb']
end