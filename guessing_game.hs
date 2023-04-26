import System.Random (randomRIO)

main :: IO ()
main = do
  putStrLn "Guess a number between 1 and 100"
  secretNumber <- randomRIO (1, 100)
  play secretNumber

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
