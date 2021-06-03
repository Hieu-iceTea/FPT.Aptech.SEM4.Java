<%--
  Created by IntelliJ IDEA.
  User: Hieu_iceTea
  Date: 03/06/2021
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="employees" scope="request"
             type="java.util.List<Hieu_iceTea.Practice_WCD.Model.Employee>"/>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <base href="<c:url value="/"/>">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>List.jsp (List of Employee)</title>
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

        <form style="display: inline" action="#logout" method="post">
            <input type="submit" value="Logout">
        </form>
    </div>

    <div class="table-wrapper" style="margin-top: 15px">
        <div class="table-title">
            <div class="row">
                <div class="col-sm-6">
                    <h2>Manage <b>Employee</b></h2>
                </div>
                <div class="col-sm-6">
                    <a href="employee/create" class="btn btn-success"><i
                            class="material-icons">&#xE147;</i> <span>Add New Employee</span></a>
                    <a href="javascript:deleteSelectedItem()" class="btn btn-danger" style="display: none"
                       onclick="return confirm('Are you sure delete all selected item?')">
                        <i class="material-icons">&#xE15C;</i>
                        <span>Delete Selected Item</span>
                    </a>
                </div>
            </div>
        </div>

        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" name="search" value="${param.search}"
                   placeholder="Search by name">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit" style="padding: 5px 5px; line-height: 0">
                <i class="material-icons" data-toggle="tooltip" style="padding: 0; margin: 0"
                   title="Search">&#xe8b6;</i>
            </button>
            <c:if test="${param.search != null && param.search != ''}">
                <button class="btn btn-outline-success my-2 my-sm-0" type="button"
                        onclick="window.location.href='employee'; return false;"
                        style="padding: 5px 5px; line-height: 0">
                    <i class="material-icons" data-toggle="tooltip" style="padding: 0; margin: 0"
                       title="Reset search, view all list">&#xe8fa;</i>
                </button>
            </c:if>
        </form>

        <c:if test="${ employees.size() != 0 }">
            <table class="table table-striped table-hover">
                <thead>
                <tr>
                    <th>
                    <span class="custom-checkbox">
                        <input type="checkbox" id="selectAll">
                        <label for="selectAll"></label>
                    </span>
                    </th>
                    <th>Id</th>

                    <th>Full Name</th>
                    <th>Birthday</th>
                    <th>Address</th>
                    <th>Position</th>
                    <th>Department</th>

                    <th style="width: 150px; display: none">Actions</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach var="employee" items="${employees}">
                    <tr>
                        <td>
                            <span class="custom-checkbox">
                                <input type="checkbox" id="checkbox${employee.id}" name="employeeIds[]"
                                       value="${employee.id}">
                                <label for="checkbox${employee.id}"></label>
                            </span>
                        </td>
                        <td>${employee.id}</td>

                        <td>${employee.fullName}</td>
                        <td>${employee.birthday}</td>
                        <td>${employee.address}</td>
                        <td>${employee.position}</td>
                        <td>${employee.department}</td>

                        <td style="display: none">
                            <a href="employee/#show/?id=${employee.id}" class="view">
                                <i class="material-icons" data-toggle="tooltip" title="View">&#xe8f4;</i>
                            </a>
                            <a href="employee/#edit/?id=${employee.id}" class="edit">
                                <i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i>
                            </a>
                            <form action="employee/#delete" method="#post" style="display: inline-block">
                                <input type="hidden" name="id" value="${ employee.id }">
                                <button class="delete" type="submit"
                                        onclick="return confirm('Are you sure delete this item?')">
                                    <i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i>
                                </button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>

            <div class="clearfix" style="display: none">
                <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
                <ul class="pagination">
                    <li class="page-item disabled"><a href="employee/#page-previous">Previous</a></li>
                    <li class="page-item"><a href="employee/#page-1" class="page-link">1</a></li>
                    <li class="page-item"><a href="employee/#page-2" class="page-link">2</a></li>
                    <li class="page-item active"><a href="employee/#page-3" class="page-link">3</a></li>
                    <li class="page-item"><a href="employee/#page-4" class="page-link">4</a></li>
                    <li class="page-item"><a href="employee/#page-5" class="page-link">5</a></li>
                    <li class="page-item"><a href="employee/#page-next" class="page-link">Next</a></li>
                </ul>
            </div>
        </c:if>

        <c:if test="${ employees.size() == 0 }">
            <div style="text-align: center; padding-top: 15px">
                <span style="font-weight: bold; font-size: 150%">
                   No data found. 😱 😥 ☹ 🤨 😴
                </span>
            </div>
        </c:if>
    </div>
</div>
</body>

<script src="assets/my-asset/script.js"></script>

<script>
    function deleteSelectedItem() {
        var employeeIds = $("input[name='employeeIds[]']:checked")
            .map(function () {
                return this.value;
            }).get();

        /*var employeeIds = [];
        $("input:checkbox[name='employeeIds[]']:checked").each(function(){
            employeeIds.push($(this).val());
        });*/

        if (employeeIds.length == 0) {
            alert("ERROR: No items selected.\nPlease select the item to delete before click this button.");
            return;
        }

        // Form here
        var myForm = document.createElement("form");
        var element_employeeIds = document.createElement("input");

        myForm.method = "POST";
        myForm.action = "employee/#delete";

        element_employeeIds.value = employeeIds;
        element_employeeIds.name = "ids";
        myForm.appendChild(element_employeeIds);

        document.body.appendChild(myForm);

        //myForm.submit();
    }
</script>

</html>
