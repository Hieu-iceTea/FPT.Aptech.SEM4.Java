<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="product"
             scope="request"
             type="com.example.WCD_WebComponentDevelopment.MVC_Demo.Model.Product"
/>

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

    <style>
        .form-group p {
            font-size: 135%;
        }
    </style>

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
                </div>
            </div>
        </div>
        <div class="">
            <div class="modal-header">
                <button class="back" style="vertical-align: middle"
                        onclick="window.location.href='product-menu'; return false;">
                    <i class="material-icons" data-toggle="tooltip" title="Back to list">&#xe5c4;</i>
                </button>
                <h4 style="display: inline-block" class="modal-title">
                    Product Detail
                </h4>
                <div style="display: inline-block; float: right">
                    <a href="product-menu/edit/?id=${product.id}" class="edit" style="margin-right: 10px">
                        <i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i>
                    </a>
                    <form action="product-menu/delete" method="post" style="display: inline-block">
                        <input type="hidden" name="id" value="${ product.id }">
                        <button class="delete" type="submit" onclick="return confirm('Are you sure delete this item?')">
                            <i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i>
                        </button>
                    </form>
                </div>
            </div>
            <div class="modal-body">

                <div class="form-group">
                    <label>id:</label>
                    <p>${ product.id }</p>
                </div>

                <div class="form-group">
                    <label>name:</label>
                    <p>${ product.name }</p>
                </div>

                <div class="form-group">
                    <label>productCategoryId:</label>
                    <p>${ product.productCategoryId }</p>
                </div>

                <div class="form-group">
                    <label>restaurantId:</label>
                    <p>${ product.restaurantId }</p>
                </div>

                <div class="form-group">
                    <label>ingredients:</label>
                    <p>${ product.ingredients }</p>
                </div>

                <div class="form-group">
                    <label>price:</label>
                    <p>${ product.price }</p>
                </div>

                <div class="form-group">
                    <label>image:</label>
                    <br>
                    <img style="height: 120px;" src="assets/my-asset/data-images/products/${product.image}"
                         alt="product.image">
                    <p>${ product.image }</p>
                </div>

                <div class="form-group">
                    <label>country:</label>
                    <p>${ product.country }</p>
                </div>

                <div class="form-group">
                    <label>tag:</label>
                    <p>${ product.tag }</p>
                </div>

                <div class="form-group">
                    <label>description:</label>
                    <p>${ product.description }</p>
                </div>

                <div class="form-group">
                    <label>featured:</label>
                    <p>${ product.featured }</p>
                </div>

                <div class="form-group">
                    <label>createdAt:</label>
                    <p>${ product.createdAt }</p>
                </div>

                <div class="form-group">
                    <label>createdBy:</label>
                    <p>${ product.createdBy }</p>
                </div>

                <div class="form-group">
                    <label>updatedAt:</label>
                    <p>${ product.updatedAt }</p>
                </div>

                <div class="form-group">
                    <label>updatedBy:</label>
                    <p>${ product.updatedBy }</p>
                </div>

                <div class="form-group">
                    <label>version:</label>
                    <p>${ product.version }</p>
                </div>

                <div class="form-group">
                    <label>deleted:</label>
                    <p>${ product.deleted }</p>
                </div>

            </div>
        </div>
    </div>
</div>
</body>

<script src="assets/my-asset/script.js"></script>

</html>