package com.javaweb.api.admin;

import com.javaweb.converter.BuildingDTOConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.service.BuildingService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@RestController(value = "buildingAPIOfAdmin")
@RequestMapping("/api/building")
public class BuildingAPI {
    @Autowired
    private BuildingService buildingService;

    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private BuildingDTOConverter buildingDTOConverter;

    @PersistenceContext
    private EntityManager entityManager;

    @PostMapping
    @Transactional
    public BuildingDTO addOrUpdateBuilding(@RequestBody BuildingDTO buildingDTO){
        return buildingService.createBuilding(buildingDTO);
    }

//    @DeleteMapping("/{id}")
//    @Transactional
//    public void deleteBuilding(@PathVariable Long id){
//        // xu ly db
//        BuildingEntity buildingEntity = buildingRepository.findById(id).get();
//        buildingEntity.getUserEntities().clear();
//        buildingRepository.save(buildingEntity);
//        buildingRepository.delete(buildingEntity);
//        System.out.println("ok");
//    }

    @DeleteMapping("/{ids}")
    @Transactional
    public void deleteBuilding(@PathVariable Long[] ids){
        buildingRepository.deleteByIdIn(ids);
    }



    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs(@PathVariable Long id){
        ResponseDTO responseDTO = buildingService.listStaffs(id);
        return responseDTO;
    }

    @PostMapping("/assignment")
    public void updateAssignmentBuilding(@RequestBody AssignmentBuildingDTO assignmentBuildingDTO){
        buildingService.updateAssignmentBuilding(assignmentBuildingDTO);
        System.out.println("ok");
    }
}
