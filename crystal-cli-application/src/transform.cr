module Transform
  VERSION = "0.1.0"
  INPUT_DATA = %([{"id":1,"author":{"name":"Jim"}},{"id":2,"author":{"name":"Bob"}}])

  def self.run(filter : String) : Bool
    result = Process.run(
      "jq",
      [filter],
      input: IO::Memory.new(INPUT_DATA),
      output: :inherit,
      error: STDERR
    )
    result.success?
  end
end
