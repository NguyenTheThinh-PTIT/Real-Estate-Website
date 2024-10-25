package com.javaweb.entity;

import javax.persistence.*;

@Entity
@Table(name = "rentarea")
public class RentAreaEntity extends BaseEntity{
    @Column(name = "value")
    private String value;

    @ManyToOne
    @JoinColumn(name = "buildingid") //foreign key
    private BuildingEntity building; // giống mappedBy bên Building entity

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public BuildingEntity getBuilding() {
        return building;
    }

    public void setBuilding(BuildingEntity building) {
        this.building = building;
    }
}
