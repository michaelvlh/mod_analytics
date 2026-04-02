with events as (
    select
        user_id,
        event_timestamp,
        lag(event_timestamp) over (
            partition by user_id
            order by event_timestamp
        ) as previous_timestamp
    from {{ ref('stg_events') }}
),

sessionised as (
    select
        *,
        case
            when previous_timestamp is null then 1
            when event_timestamp > previous_timestamp + interval '30 minutes' then 1
            else 0
        end as is_new_session
    from events
),

session_ids as (
    select
        *,
        sum(is_new_session) over (
            partition by user_id
            order by event_timestamp
        ) as session_id
    from sessionised
)

select
    user_id,
    session_id,
    min(event_timestamp) as session_start,
    max(event_timestamp) as session_end,
    count(*) as event_count
from session_ids
group by user_id, session_id