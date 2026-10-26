def average_score(scores : Array(Int32)) : Float64
  total = 0
  scores.each { |score| total += score }
  total.to_f / scores.size
end

def unique_scores(scores : Array(Int32)) : Array(Int32)
  scores.uniq
end

def print_score_report(scores : Hash(String, Int32)) : Nil
  scores.each do |name, score|
    puts "#{name}: #{score}"
  end
end
