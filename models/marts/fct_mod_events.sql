select
    user_id,
    mod_id,
    game_id,
    event_name,
    event_timestamp
from {{ ref('stg_events') }}