package com.billing.model;

public class PO {
public String po_number;
public String po_balance;
public String po_paid;
public String po_amount;
public String po_item_data;
public String supplier_id;

public String getSupplier_id() {
	return supplier_id;
}
public void setSupplier_id(String supplier_id) {
	this.supplier_id = supplier_id;
}
public String getPo_number() {
	return po_number;
}
public void setPo_number(String po_number) {
	this.po_number = po_number;
}
public String getPo_balance() {
	return po_balance;
}
public void setPo_balance(String po_balance) {
	this.po_balance = po_balance;
}
public String getPo_paid() {
	return po_paid;
}
public void setPo_paid(String po_paid) {
	this.po_paid = po_paid;
}
public String getPo_amount() {
	return po_amount;
}
public void setPo_amount(String po_amount) {
	this.po_amount = po_amount;
}
public String getPo_item_data() {
	return po_item_data;
}
public void setPo_item_data(String po_item_data) {
	this.po_item_data = po_item_data;
}
}
