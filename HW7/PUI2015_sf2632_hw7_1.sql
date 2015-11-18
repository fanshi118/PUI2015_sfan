SELECT
	/*cartodb_id,*/
	start_station_id,
	start_station_name,
	end_station_id,
	end_station_name,
	COUNT(cartodb_id) as trip_count
FROM sf2632.citibike

GROUP BY
	start_station_id,
	start_station_name,
	end_station_id,
	end_station_name
ORDER BY trip_count DESC
LIMIT 5

/*sanity check*/
/*
318
E 43 St & Vanderbilt Ave
477
W 41 St & 8 Ave
61
*/