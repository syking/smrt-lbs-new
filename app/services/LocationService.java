package services;

import java.util.ArrayList;
import java.util.List;

import models.GPSData;
import models.Location;
import models.Schedule;
import models.Vehicle;

import vo.VehicleGPS;

public class LocationService {

	public static List<VehicleGPS> findGPS() {
		List<VehicleGPS> result = new ArrayList<VehicleGPS>();
		List<Location> locations = Location.findAll();
		if (locations == null)
			return result;

		for (Location l : locations) {
			VehicleGPS vGps = new VehicleGPS();
			vGps.id = l.id;
			vGps.busPlateNumber = l.name;
			vGps.xCoord = l.longitude;
			vGps.yCoord = l.latitude;
			vGps.vehicleType = l.type;
			vGps.activeStatus = "on";

			result.add(vGps);
		}

		return result;
	}

}
