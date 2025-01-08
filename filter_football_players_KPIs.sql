-- Football_Players_Filter.sql

SELECT 
    player_id,
    player_name,
    team,
    position,
    goals,
    assists,
    passing_accuracy
FROM 
    football_players
WHERE 
    goals >= 10 -- Minimum number of goals
    AND assists >= 5 -- Minimum number of assists
    AND passing_accuracy >= 85 -- Minimum passing accuracy in percentage
    AND position IN ('Forward', 'Midfielder') -- Specific positions
ORDER BY 
    goals DESC, 
    assists DESC;
