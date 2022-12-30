
SimpleCov.formatters = [
  SimpleCov::Formatter::SimpleFormatter,
  SimpleCov::Formatter::HTMLFormatter
]

SimpleCov.coverage_dir "coverage"
if (ENV["CONFIG_HOSTS"] == "www.example.com")
  SimpleCov.coverage_dir "cobertura-unitarias"
elsif (ENV["CONFIG_HOSTS"] == "127.0.0.1")
  SimpleCov.coverage_dir "cobertura-sistema"
end

SimpleCov.start

