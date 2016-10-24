defmodule FileUtil do
  def large_lines!(path) do
    File.stream!(path)
      |> Stream.map(&String.replace(&1, "\n", ""))
      |> Enum.filter(&(String.length(&1) > 80))
      |> Enum.map(&{&1, String.length(&1)})
      |> Enum.each(
          fn{line, len} -> IO.puts "#{line} [#{len}]" end
       )
  end
end

path = System.cwd() <> "/large_lines.txt"
IO.puts FileUtil.large_lines!(path)

