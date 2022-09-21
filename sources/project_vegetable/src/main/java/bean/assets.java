package bean;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="assets")
public class assets {
	
@Id
private int asset_id;

@Column (name="asset_price",nullable=false,length=50)
private String asset_price;

@Column (name="equipment_name",nullable=false,length=50)
private String equipment_name;

@Column (name="equipment_unit",nullable=false,length=50)
private String equipment_unit;

@Column (name="product_name",nullable=false,length=50)
private String product_name;

@Column (name="product_unit",nullable=false,length=50)
private String product_unit;

@ManyToOne(cascade = CascadeType.ALL)
@JoinColumn(name="project_id",nullable=false)
private projects projects;

public assets() {
	super();
	// TODO Auto-generated constructor stub
}

public assets(int asset_id, String asset_price, String equipment_name, String equipment_unit, String product_name,
		String product_unit, bean.projects projects) {
	super();
	this.asset_id = asset_id;
	this.asset_price = asset_price;
	this.equipment_name = equipment_name;
	this.equipment_unit = equipment_unit;
	this.product_name = product_name;
	this.product_unit = product_unit;
	this.projects = projects;
}

public int getAsset_id() {
	return asset_id;
}

public void setAsset_id(int asset_id) {
	this.asset_id = asset_id;
}

public String getAsset_price() {
	return asset_price;
}

public void setAsset_price(String asset_price) {
	this.asset_price = asset_price;
}

public String getEquipment_name() {
	return equipment_name;
}

public void setEquipment_name(String equipment_name) {
	this.equipment_name = equipment_name;
}

public String getEquipment_unit() {
	return equipment_unit;
}

public void setEquipment_unit(String equipment_unit) {
	this.equipment_unit = equipment_unit;
}

public String getProduct_name() {
	return product_name;
}

public void setProduct_name(String product_name) {
	this.product_name = product_name;
}

public String getProduct_unit() {
	return product_unit;
}

public void setProduct_unit(String product_unit) {
	this.product_unit = product_unit;
}

public projects getProjects() {
	return projects;
}

public void setProjects(projects projects) {
	this.projects = projects;
}



}