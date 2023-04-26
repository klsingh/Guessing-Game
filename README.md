# Guessing-Game
## A Haskell program for the guessing game

import System.Random (randomRIO)

This line imports the randomRIO function from the System.Random module. randomRIO generates a random number in the IO monad.

main :: IO ()
main = do
  putStrLn "Guess a number between 1 and 100"
  secretNumber <- randomRIO (1, 100)
  play secretNumber

The main function starts the program. It first prints a message asking the user to guess a number between 1 and 100 using putStrLn. Then, it generates a random number between 1 and 100 using randomRIO and stores it in secretNumber. Finally, it calls the play function with the secret number as an argument.

play :: Int -> IO ()
play secretNumber = do
  putStr "Enter your guess: "
  guess <- getLine
  case reads guess of
    [(x, "")] -> do
      if x == secretNumber
        then do
          putStrLn "Congratulations! You guessed the secret number."
        else if x < secretNumber
          then do
            putStrLn "Too low, try again."
            play secretNumber
          else do
            putStrLn "Too high, try again."
            play secretNumber
    _ -> do
      putStrLn "Invalid input, please enter a number."
      play secretNumber

The play function takes the secret number as an argument and prompts the user for guesses until they guess the correct number. The function starts by using putStr to prompt the user to enter their guess. The user's guess is then read from the console using getLine.

The case expression is used to pattern match on the user's input. The reads function is used to parse the input as an Int. The reads function returns a list of pairs, where each pair contains the parsed value and the remaining unparsed input. In this case, we expect the input to contain only an Int, so we pattern match on the list to extract the parsed value x and ensure that there is no remaining unparsed input (i.e., "").

If the user's guess is a valid Int, we compare it to the secret number. If it matches, we congratulate the user and end the game. If it is too low or too high, we inform the user and call the play function again with the same secretNumber.

If the user's input is not a valid Int, we inform them and call the play function again with the same secretNumber.

    _ -> do
      putStrLn "Invalid input, please enter a number."
      play secretNumber

This case pattern matches on any other input that does not match the pattern [(x, "")]. In this case, we print a message telling the user that their input was invalid and call the play function again with the same secretNumber.

To run this program, save it to a file called guessing_game.hs and run the command runhaskell guessing_game.hs in your terminal. The program will start and ask the user to guess a number between 1 and 100. The user will then enter their guesses until they correctly guess the secret number. The program will give feedback on whether the guess was too low or too high and prompt the user to try again. When the user guesses correctly, the program will congratulate them and end.
