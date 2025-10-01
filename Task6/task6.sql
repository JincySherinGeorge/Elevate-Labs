	select year(order_date) as yr, month(order_date) as mnt, monthname(order_date) as monthname,
    sum(total_revenue) as Total_Revenue, COUNT(DISTINCT(transaction_id)) as Tot_Volume
	from order_sales
	group by year(order_date),month(order_date),monthname(order_date)
	order by yr,mnt, monthname
	;