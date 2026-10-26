require "./reading_progress"

class ProgressApp
  def self.run(input : IO, output : IO) : Nil
    total_pages = input.gets.not_nil!.to_i
    pages = input.gets.not_nil!.to_i

    progress = ReadingProgress.new(total_pages)
    progress.advance(pages)

    output.puts "#{progress.completed_pages}/#{progress.total_pages} pages (#{progress.percentage}%)"
  end
end
