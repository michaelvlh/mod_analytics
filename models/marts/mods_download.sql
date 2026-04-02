select
    mod_id,
    count(*) as download_count
from {{ ref('fct_mod_events') }}
where event_name = 'download_mod'
group by mod_id