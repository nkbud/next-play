
dynamodb {
    table = "game_schedule"
    partition_keys = ["sport_id", "provider_id", "game_id"]
    sort_key = "start_timestamp"
}

lambda {
    schedule = "every hour at 30 mins past the hour"
    function_name = "game_schedule_update"
    steps = [
        "get game schedules from hardcoded providers",
        "update dynamodb table"
    ]
    runtime = "python"
}



