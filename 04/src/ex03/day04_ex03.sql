select generated_date as missing_dates
from v_generated_dates
except
select visit_date as missing_dates
from person_visits
order by 1;