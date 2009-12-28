require 'rake/gempackagetask'

Gem::Specification.new do |s|
  s.name = %q{method_finder}
  s.version = "0.0.2"
  s.authors = ["Fabricio Nascimento", "Hugo Corbucci"]
  s.date = %q{2010-12-28}
  s.description = %q{Method_Finder is a clone for the MethodFinder functionality of Smalltalk.
It helps you find methods on a given object that receive certain arguments and achieve a given result.
Great developer tool to help people using ruby to develop their code.}
  s.email = ["fabriciosn@gmail.com", "hugo.corbucci@gmail.com"]
  s.files = ["method_finder.gemspec","lib/method_finder.rb"]
  s.require_paths = ["lib"]
  s.has_rdoc = true
  s.extra_rdoc_files = ["README", "LICENSE"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Method Finder is a useful gem to help you find out methods that will perform the operations you want.}
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.need_tar = true
  pkg.need_zip = true
end

