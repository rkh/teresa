desc "run specs"
task :spec do
  ruby '-S rspec'
end

desc "generate gemspec"
task :gemspec do
  require 'teresa/version'
  content = File.read('teresa.gemspec')
  fields  = {
    authors: `git shortlog -sn`.b.scan(/[^\d\s].*/), email: `git shortlog -sne`.b.scan(/[^<]+@[^>]+/),
    files: `git ls-files`.b.split("\n").reject { |f| f =~ /^(\.|Gemfile)/ }
  }

  fields.each do |field, values|
    updated = "  s.#{field} = [" << values.map { |v| "\n    %p" % v }.join(',') << "\n  ]"
    content.sub!(/  s\.#{field} = \[\n(    .*\n)*  \]/, updated)
  end

  content.sub!(/(s\.version.*=\s+).*/, "\\1\"#{Teresa::VERSION}\"")
  content.gsub!(/./) { |c| c.bytesize > 1 ? "\\u{#{c.codepoints.first.to_s(16)}}" : c }
  File.open('teresa.gemspec', 'w') { |f| f << content }
end

task default: [:spec, :gemspec]