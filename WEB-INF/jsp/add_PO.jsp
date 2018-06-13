<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@page import="java.util.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add New PO</title>
</head>
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/assets/css/normalize.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/assets/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/assets/css/font-awesome.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/assets/css/themify-icons.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/assets/css/flag-icon.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/assets/css/cs-skin-elastic.css">
<!-- <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/bootstrap-select.less"> -->
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/assets/scss/style.css">
<link
	href="<%=request.getContextPath() %>/assets/css/lib/vector-map/jqvmap.min.css"
	rel="stylesheet">
<script
	src="<%=request.getContextPath() %>/assets/js/vendor/jquery-2.1.4.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
<script src="<%=request.getContextPath() %>/assets/js/plugins.js"></script>
<script src="<%=request.getContextPath() %>/assets/js/main.js"></script>
<script
	src="<%=request.getContextPath() %>/assets/js/lib/chart-js/Chart.bundle.js"></script>
<script src="<%=request.getContextPath() %>/assets/js/dashboard.js"></script>
<script src="<%=request.getContextPath() %>/assets/js/widgets.js"></script>
<script
	src="<%=request.getContextPath() %>/assets/js/lib/vector-map/jquery.vmap.js"></script>
<script
	src="<%=request.getContextPath() %>/assets/js/lib/vector-map/jquery.vmap.min.js"></script>
<script
	src="<%=request.getContextPath() %>/assets/js/lib/vector-map/jquery.vmap.sampledata.js"></script>
<script
	src="<%=request.getContextPath() %>/assets/js/lib/vector-map/country/jquery.vmap.world.js"></script>
<script>
<script type="text/javascript">
function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}
</script>
<script type="text/javascript">
function generatePOnumber(){
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.open("GET", "generatePONumber", true);
	xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == 4) {
            if (xmlhttp.status == 200)
            {
                document.getElementById("po_number").value = xmlhttp.responseText;
//                 alert(xmlhttp.responseText);
            }
            else
            {
                alert('Something is wrong !!');
            }
        }
    };
     
    xmlhttp.send(null);
}
</script>
<script type="text/javascript">
var data_str = "" ;
function item_data(){
	var name = document.getElementById("item_name").value;
	var qty = document.getElementById("quantity").value;
	var price = document.getElementById("item_price").value;
	var data_str = name+"^"+qty+"^"+price ;
	alert(data_str);
	addRow(name,qty,price);
}

function addRow(name,qty,price) {
	if(data_str==null){
		data_str = name+"^"+qty+"^"+price ;
	}else{
		data_str = data_str +"~"+name+"^"+qty+"^"+price ;
	}
	
    var table = document.getElementById('diplayTable');
    // Insert New Row for table at index '0'.
    var row1 = table.insertRow(1);
    // Insert New Column for Row1 at index '0'.
    var row1col1 = row1.insertCell(0);
    row1col1.innerHTML = name;
    // Insert New Column for Row1 at index '1'.
    var row1col2 = row1.insertCell(1);
    row1col2.innerHTML = qty;
    // Insert New Column for Row1 at index '2'.
    var row1col3 = row1.insertCell(2);
    row1col3.innerHTML = price;
    
    var row1col4 = row1.insertCell(3);
    row1col4.innerHTML = "<input type='button' value='deleteRow' onclick='deleteRow(this)'>";
    // Append Table into div.
    var div = document.getElementById('item_data_table');
    div.appendChild(table);
    
    document.getElementById('item_data').value() = data_str;
}
function  deleteRow(element) {
    
    var i =element.parentNode.parentNode.rowIndex;
    var name = document.getElementById("diplayTable").rows[i].cells[0].innerHTML;
    var qty = document.getElementById("diplayTable").rows[i].cells[1].innerHTML;
    var price = document.getElementById("diplayTable").rows[i].cells[2].innerHTML;
    var temp = name+"^"+qty+"^"+price ;
    if (confirm("Do You Really Want To Delete "+i+" row !")) {
    	document.getElementById("diplayTable").deleteRow(i);
    	data_str = data_str.replace(temp,'');
    	document.getElementById('item_data').value() = data_str;
    }
}
</script>
<body><jsp:include page="header.jsp" />
	<div class="container form-control">
		<div class="container-header">
			<h3 align="center">Add New Supplier</h3>
			<br>
		</div>
		<div class="container">
			<form:form id="add_PO" action="add_PO" method="post"
				class="form-control">
				<div class="row form-group">
					<div class="col col-md-2">&nbsp;</div>
					<div class="col col-md-2">
						<label for="po_number" class="pr-1  form-control-label"><b>PO
								Number </b></label>
					</div>
					<div class="col col-md-5">
						<input type="text" id="po_number" name="po_number" readonly
							placeholder="PO NUMBER" class="form-control required">
					</div>
					<div class="col col-md-2">
						<button type="button" class="btn btn-primary btn-sm"
							onclick="generatePOnumber()">
							<i class="fa fa-dot-circle-o"></i> Generate PO Number
						</button>
					</div>
				</div>
				<div class="row form-group">
					<div class="col col-md-2">&nbsp;</div>
					<div class="col col-md-2">
						<label for="supplier_id" class="pr-1  form-control-label"><b>Select
								Seller</b></label>
					</div>
					<div class="col col-md-5">
						<select id="supplier_id" name="supplier_id" class="form-control">
							<c:forEach var="lst" items="${lst}">
								<option value="${lst}">${lst.SUPPLIER_NAME}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="row form-group">
					<div class="col col-md-2">&nbsp;</div>
					<div class="col col-md-2">
						<label for="po_amount" class="pr-1  form-control-label"><b>PO
								Amount </b></label>
					</div>
					<div class="col col-md-5">
						<input type="text" id="po_amount" name="po_amount" path="po_amount"
							onkeypress="return isNumber(event)" placeholder="PO AMOUNT"
							class="form-control textbox required">
					</div>
				</div>
				<div class="row form-group">
					<div class="col col-md-2">&nbsp;</div>
					<div class="col col-md-2">
						<label for="po_paid" class="pr-1  form-control-label"><b>PO
								Paid Amount </b></label>
					</div>
					<div class="col col-md-5">
						<input type="text" id="po_paid" name="po_paid" path="po_paid"
							onkeypress="return isNumber(event)" placeholder="PO PAID AMOUNT"
							class="form-control textbox required">
					</div>
				</div>
				<div class="row form-group">
					<div class="col col-md-2">&nbsp;</div>
					<div class="col col-md-2">
						<label for="po_balance" class="pr-1  form-control-label"><b>PO
								Outstanding Amount </b></label>
					</div>
					<div class="col col-md-5">
						<input type="text" id="po_balance" name="po_balance" path="po_balance" readonly
							placeholder="PO OUTSTANDING AMOUNT" class="form-control textbox required">
					</div>
				</div>
				<h4 align="center">Please Enter Item Data Below</h4>
				<br>
				<div class="row form-group">
					<div class="col col-md-1">
						<label for="item_name" class="pr-1  form-control-label"><b>
								Item Name </b></label>
					</div>
					<div class="col col-md-2">
						<input type="text" id="item_name" name="item_name"
							placeholder="ITEM NAME" class="form-control required">
					</div>
					<div class="col col-md-1">
						<label for="quantity" class="pr-1  form-control-label"><b>
								Item Quantity </b></label>
					</div>
					<div class="col col-md-2">
						<input type="text" id="quantity" name="quantity"
							onkeypress="return isNumber(event)" placeholder="ITEM QUANTITY"
							class="form-control required">
					</div>
					<div class="col col-md-2">
						<label for="item_price" class="pr-1  form-control-label"><b>
								Item Price Per Item </b></label>
					</div>
					<div class="col col-md-2">
						<input type="text" id="item_price" name="item_price"
							onkeypress="return isNumber(event)" placeholder="ITEM PRICE"
							class="form-control required">
					</div>
					<div class="col col-md-1">
						<button type="button" class="btn btn-info btn-sm"
							onclick="item_data()">
							<i class="fa fa-plus"></i> Add
						</button>
					</div>
				</div>
				<br>
				<div class="row form-group">
					<div class="col col-md-1">&nbsp;</div>
					<div class="col col-md-10">
						<table class="table table-striped table-bordered table-hover"
							id="diplayTable">
							<thead>
								<tr>
									<th>Item Name</th>
									<th>Quantity</th>
									<th>Item Price Per Item</th>
									<th>Delete</th>
								</tr>
							</thead>
							<tbody>
								<div id="item_data_table"></div>
							</tbody>
						</table>
					</div>
				</div>

				<div class="row form-group">
					<div class="col col-md-1">&nbsp;</div>
				</div>
				<div class="row form-group">
					<div class="col col-md-4">&nbsp;</div>
					<div class="col col-md-4">
<!-- 						<input type="hidden" id="item_data" value=""> -->
						<button type="submit" class="btn btn-primary btn-sm">
							<i class="fa fa-dot-circle-o"></i> Submit
						</button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="reset" class="btn btn-danger btn-sm">
							<i class="fa fa-ban"></i> Reset
						</button>
					</div>
				</div>

			</form:form>
			<br>
	</div>
</body><jsp:include page="footer.jsp" />
<script type="text/javascript">
var paid = 0;
var amount = 0;
var balance = 0;
$("#po_paid").keyup(function() {
	alert('hi');    
	paid = $("#po_paid").val();
	balance = amount - paid;
	document.getElementById("po_balance").value = balance;
});
</script>
<script type="text/javascript">
$("#po_amount").keyup(function() {
	alert('hi');
	amount = $("#po_amount").val();
	balance = amount - paid;
	document.getElementById("po_balance").value = balance;
});

</script>
</html>