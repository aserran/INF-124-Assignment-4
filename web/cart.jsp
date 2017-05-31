<%-- 
    Document   : cart
    Created on : May 30, 2017, 12:52:46 PM
    Author     : arca
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<link rel="stylesheet" href="style.css">
<script type="text/javascript" src="script.js"></script>
<head>
	<title>CoolFitted hats</title>
</head>
<body>
	<center>
		<div class='main'>
			<div class='content'>
				<div class='menubar'>
				<div class='name'>
					<a href="index" class="label compname">CoolFitted</a>
				</div>
				<div class='menu'>
					<a href="index" class='label home'>Home</a>
					<a href="newarr" class='label snap'>New Arrivals</a>
					<a href="snapbacks" class='label snap'>Snapbacks</a>
					<a href="strapbacks" class='label strap'>Strapbacks</a>
					<a href="aboutus.html" class='label aboutus'>About Us</a>
                                        <a href="cart.jsp" class='label cart active'>Cart</a>
					</div>
				</div>
                                <div class="featcombo">
                                    <div class="combocontent">
                                            Cart
                                    </div>
                                    <div class="cart">
                                        <center><table class="carttable" style="margin-top:3%" frame="box">
                                            <c:forEach var="element" items="${sessionScope.orders}">
                                                <c:set var="orderdet" value="${fn:split(element, '_')}" />
                                                <tr><td>${orderdet[0]}</td><td>${orderdet[1]} X ${orderdet[2]}</td>
                                                </tr>
                                            </c:forEach>
                                        </table></center>
                                    </div>
                                    <div class="subtot" style="margin-top:2%;color:#000;font-size: 16px">
                                        Total: $${sessionScope.total}
                                    </div>
                                    <br/>
                                    <hr/>
                                    
                                    <div class="checkout">
                                        <center><label style='font-size: 18px;font-weight:bold;color:#000;font-size: 20px;'>Checkout Form:</label></center>
                                        <center><form name="additem" class="orderdetails" id='checkout' action="validate.php" method="post">
                                            <table cellspacing="10px">
                                  
                                                    <tr>
                                                            <td><label for="fname">First Name: </label></td>
                                                            <td><input id ='fname' style='width:170px;' name='fname' type='text' required></td>
                                                    </tr>
                                                    <tr>
                                                            <td><label for="lname">Last Name: </label></td>
                                                            <td><input id ='lname' style='width:170px;' name='lname' type='text' required></td>
                                                    </tr>
                                                    <tr>
                                                            <td><label for="phone">Phone number: </label></td>
                                                            <td><input id ='phone' style='width:170px;' name='phone' type='phone' placeholder='XXX-XXX-XXXX' required></td>
                                                    </tr>
                                                    <tr>
                                                            <td><label for="email">Email: </label></td>
                                                            <td><input id ='email' style='width:170px;' name='email' type='email' required></td>
                                                    </tr>
                                                    <tr style="margin-top:8%;margin-bottom:8%;font-size: 17px;">
                                                            <th>Shipping Info:</th>
                                                            <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                            <td><label for="street">Shipping Adress: </label></td>
                                                            <td><input id ='street' style='width:170px;' name='street' type='text' placeholder='eg. 123 First Street' required></td>
                                                    </tr>
                                                    <tr>
                                                            <td><label for="city">City: </label></td>
                                                            <td><input id ='city' style='width:170px;' name='city' type='text' required></td>
                                                    </tr>
                                                    <tr>
                                                            <td><label for="state">State: </label></td>
                                                            <td><input id ='state' style='width:35px;' name='state' type='text' maxlength='2' required></td>
                                                    </tr>
                                                    <tr>
                                                            <td><label for="zip">Zip Code: </label></td>
                                                            <td><input id ='zip' style='width:70px;' name='zip' maxlength='5' type='number' onchange='calculate(this.value)' required></td>
                                                    </tr>
                                                    <tr style="margin-top:8%;margin-bottom:8%;font-size: 17px;">
                                                            <th>Credit Card info:</th><td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                            <td><label for="owner">Name: </label></td>
                                            <td><input  id='owner' type="text" style='width:170px;' name='owner' required></td>
                                                    </tr>
                                                    <tr>
                                                            <td><label for="cardNumber">Card Number</label></td>
                                            <td><input type="text"  id="cardNumber" style='width:170px;' name='card' required></td>
                                                    </tr>
                                                    <tr style='margin-top:5%'>
                                                            <td><label for="cvv">CVV:</label></td>
                                                            <td><input type="text" id ='cvv' style='width:50px;' maxlength='4' name='cvv' required></td>
                                                    </tr>
                                                    <tr>
                                                            <td><label name='expdate' id='expdate'>Expiration Date:</label></td>
                                            <td><select id='expmonth'>
                                                <option value="01">01</option>
                                                <option value="02">02</option>
                                                <option value="03">03</option>
                                                <option value="04">04</option>
                                                <option value="05">05</option>
                                                <option value="06">06</option>
                                                <option value="07">07</option>
                                                <option value="08">08</option>
                                                <option value="09">09</option>
                                                <option value="10">10</option>
                                                <option value="11">11</option>
                                                <option value="12">12</option>
                                            </select>
                                            <select id='expyear'>
                                                <option value="16"> 2016</option>
                                                <option value="17"> 2017</option>
                                                <option value="18"> 2018</option>
                                                <option value="19"> 2019</option>
                                                <option value="20"> 2020</option>
                                                <option value="21"> 2021</option>
                                            </select></td>
                                                    </tr>
                                                    <tr>
                                                            <td>&nbsp;</td>
                                                            <td width='100px'><span id="error" style="color:red;font-size: 14px;"></span></td>
                                                    </tr>
                                                    <tr>
                                                            <td>&nbsp;</td>
                                                            <td><input type='submit' id='submit' name='submit' value='Place Order'></td>
                                                    </tr>
                                                    <tr>
                                                            <td>&nbsp;</td>
                                                            <td width='100px' style='font-size: 10px;'>By clicking 'Place Order' you acknowledge that you are aware of the total price and the item(s) desired to purchase and that you are ready to make this purchase</td>
                                                    </tr>
                                            </table>
                                            </form></center>
                                    </div>
				</div>
                                <div class='footercombo' style="margin-top:65%;">
                                        <div class='combocontent' style="font-size: 20px">
                                                CoolFitted<span style='font-size: 13px'>&reg;</span> 2017 &#8209; All Rights Reserved
                                        </div>
                                </div>
				<br/>
				<br/>
			</div>
		</div>
	</center>
</body>
</html>
