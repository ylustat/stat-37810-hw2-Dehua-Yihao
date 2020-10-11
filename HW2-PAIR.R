generate_computer_vector <- function(min = 1, max = 10) {
  if(max - min + 1 <= 4) {
    cat("The range should at least include 5 numbers to start the game!")
  }
  computer_vector <- sample(min:max, 4, replace = F)
  return(computer_vector)
}
get_guess <- function(min = 1, max = 10, terminal=F, incorrect) {
  if(terminal) {
    cat(paste0("Please enter four numbers ranging from ",min," to ",max,": > "))
    numbers_string <- readLines("stdin", 1)
  } else {
    numbers_string <- readline(paste0("Please enter four numbers ranging from ",min," to ",max,": > "))
  }
  user_choice <- suppressWarnings(as.integer(unlist(strsplit(numbers_string, " "))))
  if(length(user_choice)!=4) {
    incorrect <- incorrect + 1
    cat(paste0("You have to input 4 numbers! This is your ",incorrect," time of incorrect input. After three times of incorrect input the game will be over!\n"))
  } else if (sum(user_choice<0,na.rm = T)>0){
    incorrect <- incorrect + 1
    cat(paste0("You have to input 4 positive numbers! This is your ",incorrect," time of incorrect input. After three times of incorrect input the game will be over!\n"))
  } else if(sum(is.na(user_choice))>0) {
    incorrect <- incorrect + 1
    cat(paste0("You have to input 4 numbers and not include any characters! This is your ",incorrect," time of incorrect input. After three times of incorrect input the game will be over!\n"))
  }else if(sum(duplicated(user_choice,na.rm = T))>0) {
    incorrect <- incorrect + 1
    cat(paste0("You have to input 4 different numbers! This is your ",incorrect," time of incorrect input. After three times of incorrect input the game will be over!\n"))
  } 
  return(list(user_choice,incorrect))
}
number_bulls_and_cows <- function(user_choice, computer_vector) {
  bulls <- rep(FALSE,4)
  cows <- rep(FALSE,4)
  for(j in 1:4){
    # If it is correct, mark it as the bulls
    if(computer_vector[j] == user_choice[j]){
      bulls[j] = TRUE
    }else{
      # However, if not bull, check if this digit is a cow
      for(k in 1:4){
        if(user_choice[j] == computer_vector[k]){
          cows[j] = TRUE
        }
      }
    }
  }
  num_bulls = sum(bulls)
  num_cows= sum(cows)
  return(list(num_bulls=num_bulls,num_cows=num_cows))
}
do_response <- function(times,num_bulls,num_cows){
  if(num_bulls == 4){
    print(paste("You have successfully guessed the number, and it take you ", i, " times."))
    break
  }else{
    if(times == 10){
      print("You have lost, the number computer guessed is ")
      print(computer_vector)
    }else{
      print(paste("You have guessed ", num_bulls, " bulls, and ", num_cows, " cows, you have ", 10-times, " times left."))
    }
  }
}


args <- commandArgs(TRUE)
terminal = as.numeric(args[1])
if(is.na(terminal)) terminal <- FALSE

computer_vector <- generate_computer_vector()
incorrect <- 0
for(i in 1:10){
  incorrect_init <- incorrect
  user_choice <- get_guess(terminal=terminal,incorrect = incorrect)
  incorrect <- user_choice[[2]]
  user_choice <- user_choice[[1]]
  if(incorrect - incorrect_init == 0) {
    number <- number_bulls_and_cows(user_choice,computer_vector)
    do_response(i, number[[1]],number[[2]])
  } 
  if(incorrect == 3) {
    print("You have lost, the number computer guessed is ")
    print(computer_vector)
    break
  }

}

