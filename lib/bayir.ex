defmodule Bayir do
   
  def main(args) do
    IO.puts "بَعير طابعة - reversed?!Hello snorld!"
    args |> parse_args |> process 
  end


  def process([]) do
    IO.puts "No arguments zgiven!"
  end

  def process(options) do 
    if options[:times] do  
      {:ok, art} = File.read "ascii.art" 
      case options[:times] do
        0 -> IO.puts "No camels, please!"
        1 -> print_ascii(art, options[:name]) # one lonely camel!
        x when x > 1 -> 
          for n <- 1..options[:times], do: 
            print_ascii(art, options[:name]) 
      end
    end
  end
       
  def print_ascii(art,name) do
    IO.puts(art)
    IO.puts "Hello #{name}!!" 
  end

  defp parse_args(args) do
    {options, _,_} = OptionParser.parse(args,
      switches: [name: :string, times: :integer]
      )
    options
  end
end
