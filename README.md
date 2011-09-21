# CTyay: A simple wrapper for the CTA Bus/Train tracker API

## Configuration

You'll need an API Key from the CTA first.
- Bus: http://www.transitchicago.com/developers/bustracker.aspx
- Train: http://www.transitchicago.com/developers/traintracker.aspx

	CTyay::Config.bus_api_key = '0118 999 881 999 119 725 3' # Use your API Key

## Basic Usage

### Get Routes:

	Routes.all # Get all routes (A collection of Route objects)
	route = Routes.route("20")
	route.short_name # 'rt' element or the number of the route "8" or "X20"
	route.common_name # 'rtnm' element or the common name "Madison" for 20 route
	route.description # Convenience method for short + common name -> "8 Halsted"

### Route Directions:

	# Routes can go in multiple directions, e.g. North/South
	Routes.route("20").directions # ["North Bound", "East Bound"]

### Route Stops:

	# After selecting a route and a direction, stops can be retrieved.
	stops = Routes.route("20").stops(direction: "East Bound") # Returns a collection of Stops
	stop = stop.first
	stop.id # 4727
	stop.name # "1633 W. Madison"
	stop.location # { 41.881265, -87.66849 }
	stop.latitude # 41.881265
	stop.longitude # -87.66849


	
	

