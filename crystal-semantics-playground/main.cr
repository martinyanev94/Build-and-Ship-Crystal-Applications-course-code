require "./score_helpers"

scores = {"Ada" => 8, "Bo" => 10, "Cy" => 8, "Dee" => 6}
puts "Average: #{average_score(scores.values)}"
puts "Unique scores: #{unique_scores(scores.values).join(", ")}"
print_score_report(scores)
