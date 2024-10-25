package com.javaweb.service.impl;

import ch.qos.logback.core.net.SyslogOutputStream;
import com.javaweb.converter.BuildingDTOConverter;
import com.javaweb.converter.BuildingSearchResponseConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.BuildingService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

@Service
public class BuildingServiceImpl implements BuildingService {

    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private BuildingDTOConverter buildingDTOConverter;

    @Autowired
    private BuildingSearchResponseConverter buildingSearchResponseConverter;

    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private RentAreaRepository rentAreaRepository;

    @Override
    public ResponseDTO listStaffs(Long buildingId) {
        BuildingEntity buildingEntity = buildingRepository.findById(buildingId).get();
        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1, "STAFF");
        List<UserEntity> staffAssignment = buildingEntity.getUserEntities();
        List<StaffResponseDTO> staffResponseDTOs = new ArrayList<>();
        ResponseDTO responseDTO = new ResponseDTO();
        for (UserEntity staff : staffs) {
            StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
            staffResponseDTO.setFullName(staff.getFullName());
            staffResponseDTO.setStaffId(staff.getId());
            if(staffAssignment.contains(staff)){
                staffResponseDTO.setChecked("checked");
            }
            else{
                staffResponseDTO.setChecked("");
            }
            staffResponseDTOs.add(staffResponseDTO);
        }
        responseDTO.setData(staffResponseDTOs);
        responseDTO.setMessage("success");
        return responseDTO;
    }

    @Override
    public List<BuildingSearchResponse> findBuilding(BuildingSearchRequest buildingSearchRequest) {
        List<BuildingEntity> buildingEntities = buildingRepository.findBuilding(buildingSearchRequest);
        List<BuildingDTO> buildingDTOs = new ArrayList<>();
        for (BuildingEntity buildingEntity : buildingEntities) {
            BuildingDTO buildingDTO = buildingDTOConverter.toBuildingDTO(buildingEntity);
            buildingDTOs.add(buildingDTO);
        }
        List<BuildingSearchResponse> buildingSearchResponses = new ArrayList<>();
        for (BuildingDTO buildingDTO : buildingDTOs) {
            BuildingSearchResponse buildingSearchResponse = buildingSearchResponseConverter.toBuildingSearchResponse(buildingDTO);
            buildingSearchResponses.add(buildingSearchResponse);
        }
        return buildingSearchResponses;
    }

    @Override
    @Transactional
    public BuildingDTO createBuilding(BuildingDTO buildingDTO) {
        try{
            BuildingEntity buildingEntity = modelMapper.map(buildingDTO, BuildingEntity.class);
            buildingEntity.setTypeCode(String.join(",", buildingDTO.getTypeCode()));
//            BuildingEntity savedBuildingEntity = buildingRepository.save(buildingEntity);
            List<RentAreaEntity> rentAreasEntity = new ArrayList<>();
            if(buildingDTO.getRentArea().length() > 0){
                List<String> rentAreas = Arrays.asList(buildingDTO.getRentArea().split(","));
                for(String rentArea : rentAreas){
                    RentAreaEntity rentAreaEntity = new RentAreaEntity();
                    rentAreaEntity.setValue(rentArea);
                    rentAreaEntity.setBuilding(buildingEntity);
//                rentAreaRepository.save(rentAreaEntity);
                    rentAreasEntity.add(rentAreaEntity);
                }
            }
            buildingEntity.setRentAreaEntities(rentAreasEntity);
            BuildingEntity savedEntity = buildingRepository.save(buildingEntity);
            System.out.println("Saved BuildingEntity: " + savedEntity);
            return buildingDTOConverter.toBuildingDTO(savedEntity);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public void updateAssignmentBuilding(AssignmentBuildingDTO assignmentBuildingDTO) {
        BuildingEntity buildingEntity = buildingRepository.findById(assignmentBuildingDTO.getBuildingId()).get();
//        buildingEntity.getUserEntities().clear();
        List<UserEntity> userEntities = new ArrayList<>();
        for(Long user_id : assignmentBuildingDTO.getStaffs()){
            UserEntity userEntity = userRepository.findById(user_id).get();
            userEntities.add(userEntity);
        }
        buildingEntity.setUserEntities(userEntities);
        buildingRepository.saveAndFlush(buildingEntity);
    }

}
