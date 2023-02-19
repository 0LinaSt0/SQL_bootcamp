select generated_date
from v_generated_dates
except
select visit_date
from person_visits
order by 1;

