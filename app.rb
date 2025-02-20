require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:home)
end

get("/:move") do
  @player_move = params.fetch("move")
  puts @player_move
  moves = ["rock" , "paper" , "scissor"]
  @comp_move = moves.sample

  winning_moves = {
    "rock" => "scissor",
    "paper" => "rock",
    "scissor" => "paper"
  }

  if @player_move == @comp_move
    @outcome = "tied"
  elsif winning_moves[@player_move] == @comp_move
    @outcome = "win"
  else
    @outcome = "lost"
  end

  erb(:move)
end
