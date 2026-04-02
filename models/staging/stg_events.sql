select
    user_id,
    mod_id,
    game_id,
    lower(event_name) as event_name,
    timestamp as event_timestamp
from {{ ref('events') }}