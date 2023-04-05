select * from Cinema
where 
mod(id,2)<>0 
and description not in ("boring") -- or description!="boring"
order by rating desc;