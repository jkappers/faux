class Scrubber
  VALUE_PROVIDERS = {
    "name"  => Proc.new { Faker::Name.name },
    "email" => Proc.new { Faker::Internet.email },
    "ssn"   => Proc.new { rand.to_s[2..10] }
  }

  def scrub(*classes)
    classes.each do |klass|
      klass.all.each { |model| fake(model) }
    end
  end

  def fake(model)
    VALUE_PROVIDERS.each { |key, method| model.send("#{key}=", method.call) if model.respond_to?("#{key}=") }
    model.save
  end
end

namespace :data do
  task :scrub => :environment do
    scrubber = Scrubber.new
    scrubber.scrub(User) # You could pass as many models as you'd like e.g. scrub(User, Admin)
  end  
end
