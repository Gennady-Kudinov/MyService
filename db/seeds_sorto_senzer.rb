# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'json'

# +Seeds+ module which contains methods for database seeding.
module Seeds
  class << self
    # +MAKES_ARRAY+ stores makes.
    MAKES_ARRAY = ['AUDI', 'ACURA', 'BMW', 'CHEVROLET', 'CHERY', 'CITROEN', 'DAEWOO', 'DAIHATSU', 'DAIHATSU',
                   'VAZ', 'GAZ', 'UAZ', 'ZAZ', 'FIAT', 'FORD', 'GEELE', 'GREAT WALL', 'HAVAL', 'HONDA', 'HYUNDAI',
                   'INFINITI', 'KIA', 'LEXUS', 'LIFAN', 'MAZDA', 'MERCEDES-BENZ', 'MITSUBISHI', 'NISSAN', 'OPEL',
                   'PEUGEOT', 'RAVON', 'RENAULT', 'ROVER', 'SKODA', 'SSANGYONG', 'SUZUKI', 'TOYOTA', 'VOLKSWAGEN',
                   'VOLVO'].freeze

    # +Seeds.generate_hashes!+                        -> Hash
    #
    # This method generates instance variables from input JSON which store makes available models.
    # 
    # @example
    #   generate_hashes!(cars_array: [{"FIAT": [{"name": "ALBEA"},{"name": "500X"}]}])
    #   instance_variable_get("@fiat_cars") #=> ["ALBEA", "500X"]
    # @param [Hash] cars_array Array of car makes and their models.
    # @return [Hash]
    def generate_hashes!(cars_array:)
      cars = JSON.parse(File.read("#{Rails.root}/lib/seeds/cars.json"))
      cars_array.each do |model|
        instance_variable_set("@#{model.gsub(/[-| ]/, '_').downcase}_cars", cars.first[model])
      end
    end

    # +Seeds.generate_models!+                        -> Array
    # 
    # This method generates database content (cars model names).
    # 
    # @example
    #   generate_models!(make_name: "FIAT", models_arr: ["ALBEA", "500X"])
    #   Make.first #=> #<Make:0x0000123 id: 1, name: "FIAT", created_at: date, updated_at: date>
    #   Model.first #=> #<Model:0x0000123 id: 1, name: "ALBEA", make_id: 1, created_at: date, updated_at: date>
    #   Model.last #=> #<Model:0x0000123 id: 1, name: "500X", make_id: 1, created_at: date, updated_at: date>
    # @param [String] make_name Cars make name.
    # @param [Array] models_arr Car models array.
    # @return [Array]
    def generate_models!(make_name:, models_arr:)
      make = Make.create!(name: make_name)
      models_arr.each do |car_hash|
        Model.create!(make: make, name: car_hash['name'])
      end
    end

    private
    def generate_ecus!
      type = Type.create(name: name)
      models_arr.each do |car_hash|
        Ecm.create!(type: type, name: car_hash["name"])
      end
    end
end

makes_array = Seeds.singleton_class::MAKES_ARRAY

Seeds.generate_hashes!(cars_array: makes_array)
makes_array.each do |model|
  Seeds.generate_models!(make_name: model, models_arr: Seeds.instance_variable_get("@#{model.gsub(/[-| ]/, '_').downcase}_cars"))
end
end