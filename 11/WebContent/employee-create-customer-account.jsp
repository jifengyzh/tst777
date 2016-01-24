<!--Author: Xiangfei Dong-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Create Customer Account</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>

<body>
  <!-- nav bar-->
  <jsp:include page="employee-header.jsp" />

  <div class="container-fluid">
    <div class="row-fluid">
      <!--side bar-->
      <div class="col-sm-3">
        <jsp:include page="employee-manage-customers-sidebar.jsp" />
      </div>

      <!--content-->
      <div class="col-sm-9">
        <!--current path-->
        <div>
          <ul class="breadcrumb">
            <li><a href="#"> <i class="icon-home"></i>Home</a></li>
            <li class="active">Create Customer Account</li>
          </ul>
        </div>

        <!--error panel-->
        <c:if test="${not empty errors}">
          <div>
            <div class="panel panel-danger">
              <div class="panel-heading">
                <h3 class="panel-title">Warning!</h3>
              </div>
              <div class="panel-body">
                 <c:forEach var="error" items="${errors}">
                	<p>${error}</p>
                </c:forEach>
              </div>
            </div>
          </div>
        </c:if>

        <!--success panel-->
        <c:if test="${not empty success}">
          <div>
            <div class="panel panel-success">
              <div class="panel-heading">
                <h3 class="panel-title">Success!</h3>
              </div>
              <div class="panel-body">
                <p>${success}</p>
                <a href="#">Return</a>
              </div>
            </div>
          </div>
        </c:if>
        
        <!--input account info-->
        <div class="row">
          <div class="col-sm-6">
            <div class="panel-default">
              <div class="panel-heading">
                <h3 class="panel-title">Create Customer Account</h3>
              </div>
              <div class="panel-body">
                <form method="post" action="employee_create_customer_account.do" >
                  <label>User Name</label>
                  <input type="text" class="form-control" name="userName" value="${form.userName}" /><br>
                  <label>Password</label>
                  <input type="password" class="form-control" name="password"/><br>
                  <label>Confirm Password</label>
                  <input type="password" class="form-control" name="confirmPassword" /><br>
                  <label>First Name</label>
                  <input type="text" class="form-control" name="firstName" value="${form.firstName}" /><br>
                  <label>Last Name</label>
                  <input type="text" class="form-control" name="lastName" value="${form.lastName}" /><br>
                  <label>Address Line 1</label>
                  <input type="text" class="form-control" name="addrLine1" value="${form.addrLine1}" /><br>
                  <label>Address Line 2</label>
                  <input type="text" class="form-control" name="addrLine2" value="${form.addrLine2}" /><br>
                  <label>City</label>
                  <input type="text" class="form-control" name="city" value="${form.city}" /><br>
                  <label>State</label>
                  <input type="text" class="form-control" name="state" value="${form.state}" /><br>
                  <label>Zip</label>
                  <input type="text" class="form-control" name="zip" value="${form.zip}" /><br>
                  <button type="submit" class="btn btn-default">Submit</button>
                </form>
              </div>
            </div>
          </div>
          <div class="col-sm-6">
          </div>
        </div>
      </div>
    </div>
  </div>

  <!--footer-->
  <jsp:include page="footer.jsp" />

</body>
</html>
