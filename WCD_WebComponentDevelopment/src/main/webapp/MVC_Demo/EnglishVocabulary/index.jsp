<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="englishVocabularies" scope="request"
             type="java.util.List<com.example.WCD_WebComponentDevelopment.MVC_Demo.Model.EnglishVocabulary>"/>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <base href="<c:url value="/"/>">

    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>English Vocabulary</title>

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <style type="text/css">
        body {
            color: #404e67;
            background: #f5f7fa;
            font-family: "Open Sans", sans-serif;
        }

        .table-wrapper {
            width: 700px;
            margin: 30px auto;
            background: #fff;
            padding: 20px;
            box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);
        }

        .table-title {
            padding-bottom: 10px;
            margin: 0 0 10px;
        }

        .table-title h2 {
            margin: 6px 0 0;
            font-size: 22px;
        }

        .table-title .add-new {
            float: right;
            height: 30px;
            font-weight: bold;
            font-size: 12px;
            text-shadow: none;
            min-width: 100px;
            border-radius: 50px;
            line-height: 13px;
        }

        .table-title .add-new i {
            margin-right: 4px;
        }

        table.table {
            table-layout: fixed;
        }

        table.table tr th,
        table.table tr td {
            border-color: #e9e9e9;
        }

        table.table th i {
            font-size: 13px;
            margin: 0 5px;
            cursor: pointer;
        }

        table.table th:last-child {
            width: 100px;
        }

        table.table td a {
            cursor: pointer;
            display: inline-block;
            margin: 0 5px;
            min-width: 24px;
        }

        table.table td a.add {
            color: #27c46b;
        }

        table.table td a.update {
            color: #27c46b;
        }

        table.table td a.edit {
            color: #ffc107;
        }

        table.table td a.delete {
            color: #e34724;
        }

        table.table td i {
            font-size: 19px;
        }

        table.table td a.add i {
            font-size: 24px;
            margin-right: -1px;
            position: relative;
            top: 3px;
        }

        table.table td a.update i {
            font-size: 24px;
            margin-right: -1px;
            position: relative;
            top: 3px;
        }

        table.table .form-control {
            height: 32px;
            line-height: 32px;
            box-shadow: none;
            border-radius: 2px;
        }

        table.table .form-control.error {
            border-color: #f50000;
        }

        table.table td .add {
            display: none;
        }

        table.table td .update {
            display: none;
        }
    </style>

    <script type="text/javascript">
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
            var actions = $("table td:last-child").html();

            // Append table with add row form on 'add new' button click
            $(".add-new").click(function () {
                $(this).attr("disabled", "disabled");
                var index = $("table tbody tr:first-child").index()-1;
                var row = $(
                    "<tr>" +
                    '<td>*</td>' +
                    '<td><input type="text" class="form-control" name="word" id="n_curr"></td>' +
                    '<td><input type="text" class="form-control" name="phonetic" id="shft_hndover"></td>' +
                    '<td><input type="text" class="form-control" name="mean" id="n_next"></td>' +
                    '<td><label style="font-weight: normal">' + '<input type="checkbox" style="transform: scale(1.3); margin-top: 10px; margin-right: 5px;" name="status" value=true id="shft_time">' + ' Done</label></td>' +
                    "<td>" +
                    actions +
                    "</td>" +
                    "</tr>");
                $("table").prepend(row);
                $("table tbody tr")
                    .eq(index + 1)
                    .find(".add, .edit")
                    .toggle();
                $('[data-toggle="tooltip"]').tooltip();

                $('table').find("input").first().focus();
            });

            // Add row on add button click
            $(document).on("click", ".add", function () {
                var empty = false;
                var input = $(this).parents("tr").find('input[type="text"]');
                input.each(function () {
                    if (!$(this).val()) {
                        $(this).addClass("error");
                        empty = true;
                    } else {
                        $(this).removeClass("error");
                    }
                });
                $(this).parents("tr").find(".error").first().focus();
                if (!empty) {
                    renderAndSubmitForm();

                    input.each(function () {
                        $(this).parent("td").html($(this).val());
                    });
                    $(this).parents("tr").find(".add, .edit").toggle();
                    $(".add-new").removeAttr("disabled");
                }
            });

            // Edit row on edit button click
            $(document).on("click", ".edit", function () {
                var nameInputs = ['id', 'word', 'phonetic', 'mean', 'status'];
                var indexNameInput = 0;

                $(this)
                    .parents("tr")
                    .find("td:not(:last-child)")
                    .each(function () {
                        if (nameInputs[indexNameInput] === 'id') {
                            $(this).html(
                                $(this).text() +

                                '<input type="hidden" class="form-control" name="' + nameInputs[indexNameInput] + '" value="' +
                                $(this).text() +
                                '">'
                            );
                        } else if (nameInputs[indexNameInput] === 'status') {
                            $(this).html(
                                '<label style="font-weight: normal">' + '<input type="checkbox" style="transform: scale(1.3); margin-top: 10px; margin-right: 5px;" name="status" value=true ' + $(this).data('check') + ' >' + ' Done</label>'
                            );
                        } else {
                            $(this).html(
                                '<input type="text" class="form-control" name="' + nameInputs[indexNameInput] + '" value="' +
                                $(this).text() +
                                '">'
                            );
                        }

                        indexNameInput++;
                    });
                $(this).parents("tr").find(".update, .edit").toggle();
                $(".add-new").attr("disabled", "disabled");
            });

            // Add row on update button click
            $(document).on("click", ".update", function () {
                var empty = false;
                var input = $(this).parents("tr").find('input[type="text"]');
                input.each(function () {
                    if (!$(this).val()) {
                        $(this).addClass("error");
                        empty = true;
                    } else {
                        $(this).removeClass("error");
                    }
                });
                $(this).parents("tr").find(".error").first().focus();
                if (!empty) {
                    renderAndSubmitForm();

                    input.each(function () {
                        $(this).parent("td").html($(this).val());
                    });
                    $(this).parents("tr").find(".update, .edit").toggle();
                    $(".add-new").removeAttr("disabled");
                }
            });

            // Delete row on delete button click
            $(document).on("click", ".delete", function () {
                var id = $(this).parents("tr").find("td:first-child").text();

                if (id !== '*') {
                    if (!confirm('Are you sure delete this item?'))
                        return;

                    // 02. Form here
                    var myForm = document.createElement("form");
                    myForm.setAttribute("style", "display: none;");

                    myForm.method = "POST";
                    myForm.action = "english-vocabulary/delete";

                    var element_id = document.createElement("input");
                    element_id.value = id;
                    element_id.name = "id";
                    myForm.appendChild(element_id);

                    document.body.appendChild(myForm);

                    myForm.submit();
                }

                //
                $(this).parents("tr").remove();
                $(".add-new").removeAttr("disabled");
            });
        });

        function renderAndSubmitForm() {
            // 01.
            var id = $('body').find("input[name='id']").val();
            var word = $("input[name='word']").val();
            var phonetic = $("input[name='phonetic']").val();
            var mean = $("input[name='mean']").val();
            var status = $("input[name='status']:checked").val() === 'true';

            // 02. Form here
            var myForm = document.createElement("form");
            myForm.setAttribute("style", "display: none;");

            if (id == null) {
                myForm.method = "POST";
                myForm.action = "english-vocabulary/create";
            } else {
                myForm.method = "POST";
                myForm.action = "english-vocabulary/edit/?id=" + id;
            }

            var element_word = document.createElement("input");
            element_word.value = word;
            element_word.name = "word";
            myForm.appendChild(element_word);

            var element_phonetic = document.createElement("input");
            element_phonetic.value = phonetic;
            element_phonetic.name = "phonetic";
            myForm.appendChild(element_phonetic);

            var element_mean = document.createElement("input");
            element_mean.value = mean;
            element_mean.name = "mean";
            myForm.appendChild(element_mean);

            var element_status = document.createElement("input");
            element_status.value = status;
            element_status.name = "status";
            myForm.appendChild(element_status);

            document.body.appendChild(myForm);

            myForm.submit();
        }
    </script>
</head>

<body>
<div class="container">
    <div class="table-wrapper">
        <div class="table-title">
            <div class="row">
                <div class="col-sm-8">
                    <h2><b>English Vocabulary</b></h2>
                </div>
                <div class="col-sm-4">
                    <button type="button" class="btn btn-info add-new">
                        <i class="fa fa-plus"></i> Add New
                    </button>
                </div>
            </div>
        </div>

        <form class="form-inline my-2 my-lg-0" style="margin-bottom: 10px">
            <input class="form-control mr-sm-2" type="search" name="search" value="${param.search}"
                   placeholder="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit" style="padding: 5px 5px; line-height: 0">
                <i class="material-icons" data-toggle="tooltip" style="padding: 0; margin: 0"
                   title="Search">&#xe8b6;</i>
            </button>
            <c:if test="${param.search != null && param.search != ''}">
                <button class="btn btn-outline-success my-2 my-sm-0" type="button"
                        onclick="window.location.href='english-vocabulary'; return false;"
                        style="padding: 5px 5px; line-height: 0">
                    <i class="material-icons" data-toggle="tooltip" style="padding: 0; margin: 0" title="Reset search, view all list">&#xe8fa;</i>
                </button>
            </c:if>
        </form>

        <table class="table table-bordered">
            <thead>
            <tr>
                <th style="width: 50px">Id</th>
                <th>Word</th>
                <th>Phonetic</th>
                <th>Mean</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach var="englishVocabulary" items="${englishVocabularies}">
                <tr>
                    <td>${englishVocabulary.id}</td>
                    <td>${englishVocabulary.word}</td>
                    <td>${englishVocabulary.phonetic}</td>
                    <td>${englishVocabulary.mean}</td>
                    <td data-check="${englishVocabulary.status ? 'checked' : ''}">
                        <span class="badge"
                            ${englishVocabulary.status ? 'style="background-color: #28a745"' : ''}>
                                ${englishVocabulary.status ? 'Done' : 'Todo'}
                        </span>
                    </td>
                    <td>
                        <a class="update" title="Update" data-toggle="tooltip">
                            <i class="material-icons">&#xe5ca;</i></a>
                        <a class="add" title="Add" data-toggle="tooltip">
                            <i class="material-icons">&#xE03B;</i></a>
                        <a class="edit" title="Edit" data-toggle="tooltip">
                            <i class="material-icons">&#xE254;</i></a>
                        <a class="delete" title="Delete" data-toggle="tooltip">
                            <i class="material-icons">&#xE872;</i></a>
                    </td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>
</div>
</body>

</html>