


def all_words_capitalized?(arr)
    arr.all? { |word| word == word.capitalize }
end

def no_valid_url?(arr)
    invalidEndings = [".com", ".net", ".io", ".org"]
    arr.none? do |url|
        invalidEndings.any? { |ending| url.end_with?(ending) }
    end
end

def any_passing_students?(arr)
    arr.any? do |student|
        grades = student[:grades]
        (grades.sum(0.0) / grades.length) >= 75
    end
end

