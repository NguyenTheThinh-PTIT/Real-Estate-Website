package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.BuildingSearchResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class BuildingDTOConverter {
    @Autowired
    private ModelMapper modelMapper;

    public BuildingDTO toBuildingDTO(BuildingEntity buildingEntity) {
        BuildingDTO buildingDTO = modelMapper.map(buildingEntity, BuildingDTO.class);
        List<RentAreaEntity> rentAreaEntityLíst = buildingEntity.getRentAreaEntities();
        String areaResult = rentAreaEntityLíst.stream().map(it -> it.getValue().toString()).collect(Collectors.joining(","));
        buildingDTO.setRentArea(areaResult);
        if(buildingEntity.getTypeCode() != null && buildingEntity.getTypeCode().length() > 0){
            List<String> typeCodes = Arrays.asList(buildingEntity.getTypeCode().split(","));
            buildingDTO.setTypeCode(typeCodes);
        }
        return buildingDTO;
    }
}
