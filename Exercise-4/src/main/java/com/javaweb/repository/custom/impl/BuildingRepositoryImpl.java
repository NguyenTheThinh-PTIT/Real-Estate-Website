package com.javaweb.repository.custom.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Repository
public class BuildingRepositoryImpl implements BuildingRepositoryCustom {

    @PersistenceContext
    private EntityManager entityManager;

    public static void joinTable(BuildingSearchRequest buildingSearchRequest, StringBuilder sql) {
        Long staffId = buildingSearchRequest.getStaffId();
        if(staffId!=null) {
            sql.append(" INNER JOIN assignmentbuilding ON b.id = assignmentbuilding.buildingid ");
        }
//        List<String> typeCode = buildingSearchRequest.getTypeCode();
//        if(typeCode!=null && typeCode.size() !=0) {
//            sql.append(" INNER JOIN buildingrenttypes ON b.id = buildingrenttypes.buildingid ");
//            sql.append(" INNER JOIN renttypes ON renttypes.id = buildingrenttypes.renttypeid ");
//        }
//		String rentAreaFrom = (String)params.get("areaFrom");
//		String rentAreaTo = (String)params.get("areaTo");
//		if(StringUtil.checkString(rentAreaFrom) || StringUtil.checkString(rentAreaTo)) {
//			sql.append(" INNER JOIN rentareas ON rentareas.buildingid = b.id ");
//		}
    }

    public static void queryNormal(BuildingSearchRequest buildingSearchRequest, StringBuilder where) {
//		for(Map.Entry<String, Object> it: params.entrySet()) {
//			if(!it.getKey().equals("staffId") && !it.getKey().equals("typeCode")
//				&& !it.getKey().startsWith("area") && !it.getKey().startsWith("rentPrice")) {
//				String value = it.getValue().toString();
//				if(StringUtil.checkString(value)) {
//					if(NumberUtil.isNumber(value)) {
//						where.append(" AND b." + it.getKey() + " = " + value);
//					}
//					else {
//						where.append(" AND b." + it.getKey() + " like '%" + value + "%' ");
//					}
//				}
//			}
//		}
        try {
            Field[] fields = BuildingSearchRequest.class.getDeclaredFields();
            for (Field item : fields) {
//				Cap quyen truy cap cac phuong thuc trong BuildingSearchBuilder cho item
                item.setAccessible(true);
                String fieldName = item.getName();
                if (!fieldName.equals("staffId") && !fieldName.startsWith("area")
                        && !fieldName.startsWith("rentPrice") && !fieldName.equals("typeCode"))  {
                    Object value = item.get(buildingSearchRequest);
                    if (value != null && value != "") {
                        if (item.getType().getName().equals("java.lang.Long")) {
                            where.append(" AND b." + fieldName + " = " + value);
                        } else {
                            where.append(" AND b." + fieldName + " like '%" + value + "%' ");
                        }
                    }
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    public static void querySpecial(BuildingSearchRequest buildingSearchRequest, StringBuilder where) {
        Long staffId = buildingSearchRequest.getStaffId();
        if(staffId!=null) {
            where.append(" AND assignmentbuilding.staffid = " + staffId);
        }
        Long rentAreaFrom = buildingSearchRequest.getAreaFrom();
        Long rentAreaTo = buildingSearchRequest.getAreaTo();
        if(rentAreaFrom != null || rentAreaTo != null) {
            where.append(" AND EXISTS (SELECT * FROM rentarea r WHERE r.buildingid = b.id ");
            if(rentAreaFrom != null) {
                where.append(" AND r.value >=" + rentAreaFrom);
            }
            if(rentAreaTo != null) {
                where.append(" AND r.value <=" + rentAreaTo);
            }
            where.append(" ) ");
        }
        Long rentPriceFrom = buildingSearchRequest.getRentPriceFrom();
        Long rentPriceTo = buildingSearchRequest.getRentPriceTo();
        if(rentPriceFrom != null || rentPriceTo!= null) {
            if(rentPriceFrom != null) {
                where.append(" AND b.rentprice >=" + rentPriceFrom);
            }
            if(rentPriceTo!= null) {
                where.append(" AND b.rentprice <=" + rentPriceTo);
            }
        }
//		java 7
        List<String> typeCode = buildingSearchRequest.getTypeCode();
		if(typeCode!=null && typeCode.size() !=0) {
            where.append(" AND b.type LIKE '%" + typeCode.get(0) + "%'");
            for(int i = 1; i < typeCode.size(); i++) {
                where.append(" OR b.type LIKE '%" + typeCode.get(i) + "%' ");
            }
        }
    }

//		java 8
//        List<String> typeCode = buildingSearchRequest.getTypeCode();
//        if(typeCode!=null && typeCode.size()!=0) {
//            where.append(" AND ( ");
//            String sql = typeCode.stream().map(it -> " renttypes.code LIKE " + "'%" + it + "%' ").collect(Collectors.joining(" OR "));
//            where.append(sql);
//            where.append(" ) ");
//        }
//    }

    @Override
    public List<BuildingEntity> findBuilding(BuildingSearchRequest buildingSearchRequest) {
        StringBuilder sql = new StringBuilder("SELECT b.* FROM building b "); //select b.* là lấy hết các thuộc tính bên entity chứ kphai trong table
        joinTable(buildingSearchRequest, sql);
        StringBuilder where = new StringBuilder(" WHERE 1=1 ");
        queryNormal(buildingSearchRequest, where);
        querySpecial(buildingSearchRequest, where);
        where.append(" GROUP BY b.id ");
        sql.append(where);
        Query query = entityManager.createNativeQuery(sql.toString(), BuildingEntity.class);
        return query.getResultList();
    }


}
