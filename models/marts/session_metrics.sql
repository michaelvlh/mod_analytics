select
    user_id,
    count(*) as total_sessions,
    avg(event_count) as avg_events_per_session
from {{ ref('user_sessions') }}
group by user_id