<%--
  Created by IntelliJ IDEA.
  User: Hieu_iceTea
  Date: 03/06/2021
  Time: 15:38
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <base href="<c:url value="/"/>">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Employee.jsp (Create Employee)</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="assets/my-asset/style.css">
<body>
<div class="container">

    <div style="margin-top: 15px">
        <a style="background-color: greenyellow; padding: 5px; border-radius: 10%" href="">Home</a> |

        <span>
            Welcome,
            <b style="background-color: greenyellow; padding: 5px; border-radius: 10%">Hieu_iceTea</b>
        </span>

        <form style="display: inline" action="logout" method="post">
            <input type="submit" value="Logout">
        </form>
    </div>

    <div class="table-wrapper" style="margin-top: 15px">
        <div class="table-title">
            <div class="row">
                <div class="col-sm-6">
                    <h2>Manage <b>Employee</b></h2>
                </div>
            </div>
        </div>
        <div class="">

            <form action="employee/create" method="post">
                <div class="modal-header">
                    <button class="back" style="vertical-align: middle"
                            onclick="window.location.href='employee'; return false;">
                        <i class="material-icons" data-toggle="tooltip" title="Back to list">&#xe5c4;</i>
                    </button>
                    <h4 style="display: inline-block" class="modal-title">Create Employee</h4>
                    <div style="display: inline-block; float: right">
                        <button type="submit" class="save">
                            <i class="material-icons" style="font-weight: bold; padding-right: 10px" data-toggle="tooltip" title="Save">&#xe5ca;</i>
                        </button>
                        <button class="cancel"
                                onclick="window.location.href='employee'; return false;">
                            <i class="material-icons" style="font-weight: bold" data-toggle="tooltip" title="Cancel">&#xe5cd;</i>
                        </button>
                    </div>
                </div>

                <div class="modal-body">
                    <div class="form-group">
                        <label>Full Name:</label>
                        <input class="form-control" type="text" name="full_name" required>
                    </div>

                    <div class="form-group">
                        <label>Birthday <span style="font-weight: normal">(Do not choose the future day)</span>:</label>
                        <input class="form-control max-date-today" type="date" max="" name="birthday" required>
                    </div>

                    <div class="form-group">
                        <label>Address:</label>
                        <textarea class="form-control" name="address" rows="3" required></textarea>
                    </div>

                    <div class="form-group">
                        <label>Position:</label>
                        <input class="form-control" type="text" name="position" required>
                    </div>

                    <div class="required-group">
                        <label>Department:</label>
                        <input class="form-control" type="text" name="department" required>
                    </div>

                    <div class="modal-footer">
                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                        <input type="submit" class="btn btn-info" value="Save">
                    </div>
                </div>
            </form>

        </div>
    </div>
</div>
</body>

<script src="assets/my-asset/script.js"></script>

<script>
    //Set date input field's max date to today: (https://stackoverflow.com/questions/32378590/set-date-input-fields-max-date-to-today)
    var today = new Date().toISOString().split("T")[0];
    document.getElementsByClassName("max-date-today")[0].setAttribute("max", today);
</script>

</html>
