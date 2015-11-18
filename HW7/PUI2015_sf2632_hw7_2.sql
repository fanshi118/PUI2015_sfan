SELECT
	/*cartodb_id,*/
	start_station_id,
	start_station_name,
	CDB_TransformToWebmercator(CDB_LatLng(
      start_station_latitude,
      start_station_longitude
      )
    ) as the_geom_webmercator,
	COUNT(cartodb_id) as trip_count
FROM sf2632.citibike

WHERE
	ST_DWithin(CDB_LatLng(
      end_station_latitude,
      end_station_longitude
    )::geography,
      CDB_LatLng(40.7307602, -73.9974086)::geography,1000)

GROUP BY
	start_station_id,
	start_station_name,
	start_station_latitude,
	start_station_longitude
ORDER BY trip_count DESC

/*sanity check*/
/*
293
Lafayette St & E 8 St
171
*/