<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="products" scope="request"
             type="java.util.List<com.example.WCD_WebComponentDevelopment.MVC_Demo.Model.Product>"/>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <base href="<c:url value="/"/>">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Product Menu</title>
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

        <c:if test="${sessionScope.isLoggedIn}">
                <span>Welcome, <b
                        style="background-color: greenyellow; padding: 5px; border-radius: 10%">${sessionScope.user.username}</b></span>

            <form style="display: inline" action="logout" method="post">
                <input type="submit" value="Logout">
            </form>
        </c:if>

        <c:if test="${!sessionScope.isLoggedIn}">
            <a style="background-color: greenyellow; padding: 5px; border-radius: 10%" href="login">Login</a>
        </c:if>
    </div>

    <div class="table-wrapper" style="margin-top: 15px">
        <div class="table-title">
            <div class="row">
                <div class="col-sm-6">
                    <h2>Manage <b>Product Menus</b></h2>
                </div>
                <div class="col-sm-6">
                    <a href="product-menu/create" class="btn btn-success"><i
                            class="material-icons">&#xE147;</i> <span>Add New Product</span></a>
                    <a href="javascript:deleteSelectedItem()" class="btn btn-danger"
                       onclick="return confirm('Are you sure delete all selected item?')">
                        <i class="material-icons">&#xE15C;</i>
                        <span>Delete Selected Item</span>
                    </a>
                </div>
            </div>
        </div>

        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" name="search" value="${param.search}"
                   placeholder="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit" style="padding: 5px 5px; line-height: 0">
                <i class="material-icons" data-toggle="tooltip" style="padding: 0; margin: 0"
                   title="Search">&#xe8b6;</i>
            </button>
            <c:if test="${param.search != null && param.search != ''}">
                <button class="btn btn-outline-success my-2 my-sm-0" type="button"
                        onclick="window.location.href='product-menu'; return false;"
                        style="padding: 5px 5px; line-height: 0">
                    <i class="material-icons" data-toggle="tooltip" style="padding: 0; margin: 0" title="Reset search, view all list">&#xe8fa;</i>
                </button>
            </c:if>
        </form>

        <c:if test="${ products.size() != 0 }">
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
                    <th>Image</th>
                    <th>Name</th>
                    <th>Ingredients</th>
                    <th>Price</th>
                    <th style="width: 150px">Actions</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach var="product" items="${products}">
                    <tr>
                        <td>
                    <span class="custom-checkbox">
                        <input type="checkbox" id="checkbox${product.id}" name="productIds[]" value="${product.id}">
                        <label for="checkbox${product.id}"></label>
                    </span>
                        </td>
                        <td>${product.id}</td>
                        <td>
                            <img style="height: 75px;" src="assets/my-asset/data-images/products/${product.image}"
                                 alt="product.image">
                        </td>
                        <td>${product.name}</td>
                        <td>${product.ingredients}</td>
                        <td>$${product.price}</td>
                        <td>
                            <a href="product-menu/show/?id=${product.id}" class="view">
                                <i class="material-icons" data-toggle="tooltip" title="View">&#xe8f4;</i>
                            </a>
                            <a href="product-menu/edit/?id=${product.id}" class="edit">
                                <i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i>
                            </a>
                            <form action="product-menu/delete" method="post" style="display: inline-block">
                                <input type="hidden" name="id" value="${ product.id }">
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

            <div class="clearfix">
                <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
                <ul class="pagination">
                    <li class="page-item disabled"><a href="#">Previous</a></li>
                    <li class="page-item"><a href="#" class="page-link">1</a></li>
                    <li class="page-item"><a href="#" class="page-link">2</a></li>
                    <li class="page-item active"><a href="#" class="page-link">3</a></li>
                    <li class="page-item"><a href="#" class="page-link">4</a></li>
                    <li class="page-item"><a href="#" class="page-link">5</a></li>
                    <li class="page-item"><a href="#" class="page-link">Next</a></li>
                </ul>
            </div>
        </c:if>

        <c:if test="${ products.size() == 0 }">
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
        var productIds = $("input[name='productIds[]']:checked")
            .map(function () {
                return this.value;
            }).get();

        /*var productIds = [];
        $("input:checkbox[name='productIds[]']:checked").each(function(){
            productIds.push($(this).val());
        });*/

        if (productIds.length == 0) {
            alert("ERROR: No items selected.\nPlease select the item to delete before click this button.");
            return;
        }

        // Form here
        var myForm = document.createElement("form");
        var element_productIds = document.createElement("input");

        myForm.method = "POST";
        myForm.action = "product-menu/delete";

        element_productIds.value = productIds;
        element_productIds.name = "ids";
        myForm.appendChild(element_productIds);

        document.body.appendChild(myForm);

        myForm.submit();
    }
</script>

</html>