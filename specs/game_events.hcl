


dynamodb {
    table = "game_events"
    partition_keys = ["sport_id", "game_id"]
    sort_key = "timestamp"
}

lightsail {
    lifecycle {
        "orchestrated_by": "lambda"
        "controlled_by": "tags"
        "tags": {
            "start_time": "2022-10-01T00:00:00Z"
            "end_time": "2022-10-01T23:59:59Z"
        }
    }
    size {
        memory = "1 GB"
        cpu = "2 vCPUs"
        disk = "40 GB SSD"
        transfer = "2 TB"
    }
    image = "ubuntu-22-04-arm64"
    region = "us-east-1"
    instance_name = "game_event_updater"
    startup_script = [
        "update, install"
        "download git release of a repo, unzip"
        "docker compose up"
    ]
    iam {
        role = "game_event_updater"
        policy = [
            "dynamodb:Get",
            "appsync:Mutation",
        ]
    }
}