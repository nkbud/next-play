# Data Models

## Game Events

*   **Table:** `game_events`
*   **Partition Keys:** `sport_id`, `game_id`
*   **Sort Key:** `timestamp`

## Game Schedule

*   **Table:** `game_schedule`
*   **Partition Keys:** `sport_id`, `provider_id`, `game_id`
*   **Sort Key:** `start_timestamp`


