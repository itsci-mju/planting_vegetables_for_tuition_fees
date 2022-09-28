package bean;

import java.util.Calendar;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table (name="transaction")

public class transaction {
@Id
@Column(name="transaction_id")
private int transaction_id;

@Column(name="date_time",nullable=false)
private Calendar date_time;

@Column(name="total_price",nullable=false)
private double total_price;

@Column (name="term",nullable=false)
private String term;

@ManyToOne(cascade = CascadeType.ALL)
@JoinColumn(name="member_id",nullable=false)
private member member;

public transaction() {
	super();
	// TODO Auto-generated constructor stub
}

public transaction(int transaction_id, Calendar date_time, double total_price, String term, member member) {
	super();
	this.transaction_id = transaction_id;
	this.date_time = date_time;
	this.total_price = total_price;
	this.term = term;
	this.member = member;
}

public int getTransaction_id() {
	return transaction_id;
}

public void setTransaction_id(int transaction_id) {
	this.transaction_id = transaction_id;
}

public Calendar getDate_time() {
	return date_time;
}

public void setDate_time(Calendar date_time) {
	this.date_time = date_time;
}

public double getTotal_price() {
	return total_price;
}

public void setTotal_price(double total_price) {
	this.total_price = total_price;
}

public String getTerm() {
	return term;
}

public void setTerm(String term) {
	this.term = term;
}

public member getMember() {
	return member;
}

public void setMember(member member) {
	this.member = member;
}


}
