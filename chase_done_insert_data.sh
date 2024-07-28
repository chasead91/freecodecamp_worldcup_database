#! /bin/bash

#if [[ $1 == "test" ]]
#then
#  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
#else
#  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
#fi

# Do not change code above this line. Use the PSQL variable above to query your database.

PSQL="psql --username=chase --dbname=worldcup -t --no-align -c"

#Truncate Tables
echo $($PSQL "TRUNCATE teams, games")

#Insert data in to teams table
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $WINNER != 'winner' ]]; then
    #Get id of WINNER
    WINNER_ID_RESULT=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER';")
    #If not found
    if [[ -z $WINNER_ID_RESULT ]]; then
    #Insert WINNER
    INSERT_WINNER=$($PSQL "INSERT INTO teams(name) VALUES ('$WINNER')")
    #Output
    if [[ $INSERT_WINNER == "INSERT 0 1" ]]; then
      echo "Inserted into teams $WINNER"
    fi
    fi
    #Get id of OPPONENT
    OPPONENT_ID_RESULT=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
    #If not found
    if [[ -z $OPPONENT_ID_RESULT ]]; then
    #Insert OPPONENT
    INSERT_OPPONENT=$($PSQL "INSERT INTO teams(name) VALUES ('$OPPONENT')")
    #Output
    if [[ $INSERT_OPPONENT == "INSERT 0 1" ]]; then
      echo "Inserted into teams $OPPONENT"
    fi
    fi
  fi
done | sort -u

#Insert data into games table
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != "year" ]]; then
  #Get WINNER id
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
  #Get OPPONENT id
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
  #Insert game data in to games table
  INSERT_GAME=$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
  #Output
  if [[ $INSERT_GAME == "INSERT 0 1" ]]; then
    echo "Inserted 1 record in games"
  fi
  fi
done