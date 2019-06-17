package trapick.schedule.mapper;

import java.util.List;

import trapick.schedule.domain.Country;

public interface ScheduleMapper {
	
	List<Country> selectCountry();

	List<String> selectCity(String country_name);

	String selectStartDate(String idx);
}
