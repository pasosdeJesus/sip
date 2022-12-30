
SimpleCov.formatters = [
  SimpleCov::Formatter::SimpleFormatter,
  SimpleCov::Formatter::HTMLFormatter
]

if (ENV["CONFIG_HOSTS"] == "www.example.com")
  SimpleCov.coverage_dir "cobertura-pruebas"
else
  SimpleCov.coverage_dir "cobertura-sistema"
end
SimpleCov.start

