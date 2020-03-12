
SELECT  Name, Phone
            FROM(SELECT FName Name, Phone, CurrentLocation Location, Locations.Latitude Lat, Locations.Longtitude Lon FROM Users, Locations WHERE Users.CurrentLocation = Locations.LocationId AND Users.GroupId = 2)
            AS CurrentLocations WHERE(acos(sin(47.5412021 * pi() / 180) * sin(Lat * pi() / 180) + cos(47.5412021 * pi() / 180) * cos(Lat * pi() / 180) * cos(pi() / 180 * (Lon - (-122.2675626)))) * 3958.8 <= 100);
GO