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

