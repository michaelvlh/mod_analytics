with views as (
    select mod_id, count(*) as views
    from {{ ref('fct_mod_events') }}
    where event_name = 'view_mod'
    group by mod_id
),
downloads as (
    select mod_id, count(*) as downloads
    from {{ ref('fct_mod_events') }}
    where event_name = 'download_mod'
    group by mod_id
)

select
    v.mod_id,
    v.views,
    coalesce(d.downloads, 0) as downloads,
    coalesce(d.downloads, 0) * 1.0 / v.views as conversion_rate
from views v
left join downloads d using (mod_id)