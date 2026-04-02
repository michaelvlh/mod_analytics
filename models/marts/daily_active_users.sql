select
    date(event_timestamp) as date,
    count(distinct user_id) as dau
from {{ ref('fct_mod_events') }}
group by date