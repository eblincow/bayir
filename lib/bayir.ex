defmodule Bayir do
   
  def main(args) do
    IO.puts "بَعير طابعة - !Hello snorld!"
    args |> parse_args |> process 
  end


  def process([]) do
    IO.puts "No arguments given!"
  end

  def process(options) do 
    if options[:times] && options[:kind] do  
    {_, art} =  
      case options[:kind] do
        "camel" -> File.read "ascii_art/camel1.ascii" 
        "parrot" -> File.read "ascii_art/parrot.ascii"
        "snoopy" -> File.read "ascii_art/snoopy.ascii" 
        "bunny" -> File.read "ascii_art/bunny.ascii" 
        _ -> {:ok,"AAAAAAAAAAAAAAAABBBBBBBBBAAAAAA"}
      end 
      case options[:times] do
        0 -> IO.puts "No times, whaa?"
        1 -> print_ascii(art, options[:name]) # one lonely camel!
        x when x > 1 -> 
          for _ <- 1..options[:times], do: 
            print_ascii(art, options[:name]) 
      end
    end
  end
       
  def print_ascii(art,name) do
    IO.puts(art)
    IO.puts "#{name}!!" 
  end

  defp parse_args(args) do
    {options, _,_} = OptionParser.parse(args,
      switches: [name: :string, times: :integer]
      )
    options
  end
end
