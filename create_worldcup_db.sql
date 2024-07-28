CREATE OR REPLACE FUNCTION create_worldcup_db() RETURNS VOID AS $$
BEGIN

    EXECUTE 'CREATE DATABASE worldcup';

    PERFORM pg_switch_database('worldcup');

    EXECUTE 'CREATE TABLE teams (
        team_id SERIAL PRIMARY KEY NOT NULL,
        name UNIQUE NOT NULL
    )';

    EXECUTE 'CREATE TABLE games (
        game_id SERIAL PRIMARY KEY NOT NULL,
        year INT NOT NULL,
        round VARCHAR(30) NOT NULL,
        winner_id INT NOT NULL,
        opponent_id INT NOT NULL,
        winner_goals INT NOT NULL,
        opponent_goals INT NOT NULL,
        FOREIGN KEY (winner_id) REFERENCES teams(team_id),
        FOREIGN KEY (opponent_id) REFERENCES teams(team_id)
    )';
END;
$$ LANGUAGE plpgsql;