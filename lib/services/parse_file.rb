require 'csv'
module Services
  class ParseFile
    def initialize(file)
      @file = file
      @fm_model = FuzzyMatch.new(Model.all, read: :name, threshold: 0.5) # https://github.com/seamusabshere/fuzzy_match
      @fm_color = FuzzyMatch.new(Color.all, read: :name, threshold: 0.5)
    end

    def parse_file
      result = CSV.generate do |csv|
        result = []
        CSV.foreach(@file.path, headers: true, col_sep: ';') do |row|
          model = find_model(row[0])
          color = find_color(row[0])
          # остальные свойства подбирать через regexp
          csv << [model, color]
        end
      end
      result
    end

    def find_model(str)
      str.split.each do |row|
        result = @fm_model.find(row)
        return result.name unless result.nil?
      end
      ''
    end

    def find_color(str)
      colors = []
      str.split(/[^[[:word:]]]+/).each do |row|
        next if row.length < 4 # отсечь ТУ и прочее

        result = @fm_color.find(row)
        colors << result.name unless result.nil?
      end
      colors.join('-')
    end
  end
end
