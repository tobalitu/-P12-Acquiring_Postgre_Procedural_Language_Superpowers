create or replace function show_prod_cat_plpgsql() returns setof products as $$
declare
    reg          record;
     cat_id cursor for select * from products
	where products.category = cat_id;
begin
   open cat_id;
fetch  cat_id into reg;
raise notice ' procesando  %', reg.products;
close  cat_id;
end; $$ language plpgsql;

select show_prod_cat_plpgsql(1);
