package com.javaweb.converter;

import com.javaweb.enums.DistrictCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.BuildingSearchResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BuildingSearchResponseConverter {
    @Autowired
    private ModelMapper modelMapper;

    public BuildingSearchResponse toBuildingSearchResponse(BuildingDTO buildingDTO) {
        BuildingSearchResponse buildingSearchResponse = modelMapper.map(buildingDTO, BuildingSearchResponse.class);
        buildingSearchResponse.setAddress(buildingDTO.getStreet() + ", " + buildingDTO.getWard() +", " + DistrictCode.getDistrictNameByCode(buildingDTO.getDistrict()));
        return buildingSearchResponse;
    }
}
