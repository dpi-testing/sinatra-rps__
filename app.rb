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

  if @player_move == @comp_move
    @outcome = "tied"
  elsif @player_move == "rock" 
    if @comp_move == "paper"
      @outcome = "lost"
    else
      @outcome = "win"
    end

  elsif @player_move == "paper" 
    if @comp_move == "scissors"
      @outcome = "lost"
    else
      @outcome = "win"
    end

  elsif @player_move == "scissors" 
    if @comp_move == "rock"
      @outcome = "lost"
    else
      @outcome = "win"
    end
  end
  erb(:move)
end

  

  


# get("/paper") do
#   moves = ["rock" , "paper" , "scissor"]
#   @comp_move = moves.sample

#   if @comp_move == "scissors"
#     @outcome = "lost"
#   elsif @comp_move == "paper"
#     @outcome = "tied"
#   else
#     @outcome = "won"
#   end

#   erb(:paper)

# end


# get("/scissors") do
#   moves = ["rock" , "paper" , "scissor"]
#   @comp_move = moves.sample

#   if @comp_move == "scissors"
#     @outcome = "tied"
#   elsif @comp_move == "rock"
#     @outcome = "lost"
#   else
#     @outcome = "won"
#   end

#   erb(:scissors)

# end
