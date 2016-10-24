defmodule FileUtil do
  def large_lines!(path) do
    File.stream!(path)
      |> Stream.map(&String.replace(&1, "\n", ""))
      |> Enum.filter(&(String.length(&1) > 80))
  end
end

path = System.cwd() <> "/large_lines.txt"
IO.puts FileUtil.large_lines!(path)

