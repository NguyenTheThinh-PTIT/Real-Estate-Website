<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@include file="/common/taglib.jsp" %>
<%--
  Created by IntelliJ IDEA.
  User: The Thinh
  Date: 10/8/2024
  Time: 9:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh sách tòa nhà</title>
</head>
<body>
<div class="main-content ace-save-state" id="main-container">
    <div class="main-content">
        <div class="main-content-inner">
            <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="#">Trang chủ</a>
                    </li>
                    <li class="active">Quản lý tòa nhà</li>
                </ul><!-- /.breadcrumb -->
            </div>

            <div class="page-content">
                <div class="page-header">
                    <h1>
                        Dashboard
                        <small>
                            <i class="ace-icon fa fa-angle-double-right"></i>
                            overview &amp; stats
                        </small>
                    </h1>
                </div><!-- /.page-header -->

                <div class="row">
                    <div class="col-xs-12" id="widget-container-col-1">
                        <div class="widget-box ui-sortable-handle" id="widget-box-1">
                            <div class="widget-header">
                                <h5 class="widget-title">Tìm kiếm</h5>

                                <div class="widget-toolbar">
                                    <a href="#" data-action="collapse">
                                        <i class="ace-icon fa fa-chevron-up"></i>
                                    </a>
                                </div>
                            </div>

                            <div class="widget-body" style="font-family: Arial, Helvetica, sans-serif">
                                <div class="widget-main">
                                    <form:form modelAttribute="modelSearch" id="listForm" action="/admin/building-list" method="get">
                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-xs-6">
                                                        <label for="name" class="name">Tên tòa nhà</label>
<%--                                                        <input type="text" class="form-control" name="name" value="${modelSearch.name}">--%>
                                                        <form:input class="form-control" path="name"/>
                                                    </div>
                                                    <div class="col-xs-6">
                                                        <label for="name" class="name">Diện tích sàn</label>
<%--                                                        <input type="number" class="form-control" name="floorArea" value="${modelSearch.floorArea}">--%>
                                                        <form:input path="floorArea" class="form-control"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-xs-2">
                                                        <label for="name" class="name">Quận</label>
                                                        <form:select class="form-control" path="district">
                                                            <form:option value="">--- Chọn Quận</form:option>
                                                            <form:options items="${districts}"></form:options>
                                                        </form:select>
                                                    </div>
                                                    <div class="col-xs-5">
                                                        <label for="name" class="name">Phường</label>
<%--                                                        <input type="text" class="form-control" name="ward" value="${modelSearch.ward}">--%>
                                                        <form:input path="ward" class="form-control"/>
                                                    </div>
                                                    <div class="col-xs-5">
                                                        <label for="name" class="name">Đường</label>
<%--                                                        <input type="text" class="form-control" name="street" value="">--%>
                                                        <form:input path="street" class="form-control"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-xs-4">
                                                        <label for="name" class="name">Số tầng hầm</label>
<%--                                                        <input type="text" class="form-control" name="numberOfBasement" value="">--%>
                                                        <form:input path="numberOfBasement" class="form-control"/>
                                                    </div>
                                                    <div class="col-xs-4">
                                                        <label for="name" class="name">Hướng</label>
<%--                                                        <input type="text" class="form-control" name="direction" value="">--%>
                                                        <form:input path="direction" class="form-control"/>
                                                    </div>
                                                    <div class="col-xs-4">
                                                        <label for="name" class="name">Hạng</label>
<%--                                                        <input type="text" class="form-control" name="level" value="">--%>
                                                        <form:input path="level" class="form-control"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-xs-3">
                                                        <label for="name" class="name">Diện tích từ</label>
<%--                                                        <input type="text" class="form-control" name="areaFrom" value="">--%>
                                                        <form:input path="areaFrom" class="form-control"/>
                                                    </div>
                                                    <div class="col-xs-3">
                                                        <label for="name" class="name">Diện tích đến</label>
<%--                                                        <input type="text" class="form-control" name="areaTo" value="">--%>
                                                        <form:input path="areaTo" class="form-control"/>
                                                    </div>
                                                    <div class="col-xs-3">
                                                        <label for="name" class="name">Giá thuê từ</label>
<%--                                                        <input type="text" class="form-control" name="rentPriceFrom" value="">--%>
                                                        <form:input path="rentPriceFrom" class="form-control"/>
                                                    </div>
                                                    <div class="col-xs-3">
                                                        <label for="name" class="name">Giá thuê đến</label>
<%--                                                        <input type="text" class="form-control" name="rentPriceTo" value="">--%>
                                                        <form:input path="rentPriceTo" class="form-control"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-xs-5">
                                                        <label for="name" class="name">Tên quản lý</label>
<%--                                                        <input type="text" class="form-control" name="managerName" value="">--%>
                                                        <form:input path="managerName" class="form-control"/>
                                                    </div>
                                                    <div class="col-xs-5">
                                                        <label for="name" class="name">Điện thoại quản lý</label>
<%--                                                        <input type="text" class="form-control" name="managerPhone" value="">--%>
                                                        <form:input path="managerPhone" class="form-control"/>
                                                    </div>
                                                    <div class="col-xs-2">
                                                        <label for="name" class="name">Nhân viên</label>
                                                        <form:select class="form-control" path="staffId">
                                                            <form:option value="">--- Chọn Nhân viên</form:option>
                                                            <form:options items="${listStaffs}"></form:options>
<%--                                                            value hiển thị sẽ là key của map --%>
                                                        </form:select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-xs-6">
                                                        <form:checkboxes items="${typeCodes}" path="typeCode"></form:checkboxes>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-xs-6">
                                                        <button type="button" class="btn btn-danger" id="btnSearchBuilding">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                                                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"></path>
                                                            </svg>
                                                            Tìm kiếm
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form:form>
                                </div>
                            </div>

                            <div class="pull-right">
                                <a href="/admin/building-edit">
                                    <button class="btn btn-info btn-lg" title="Thêm tòa nhà">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-add" viewBox="0 0 16 16">
                                            <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0"/>
                                            <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                            <path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                        </svg>
                                    </button>
                                </a>
                                <button class="btn btn-danger btn-lg" title="Xóa tòa nhà" id="btnDeleteBuilding">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-dash" viewBox="0 0 16 16">
                                        <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1"/>
                                        <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                        <path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                    </svg>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Bảng danh sách -->
                <div class="row" style="margin-top: 4rem;">
                    <div class="col-xs-12">
                        <table id="tableList" class="table table-striped table-bordered table-hover">
                            <thead>
                            <tr>
                                <th class="center">
                                    <label class="pos-rel">
                                        <input type="checkbox" name="checkList" value="" class="ace">
                                        <span class="lbl"></span>
                                    </label>
                                </th>
                                <th>Tên tòa nhà</th>
                                <th>Địa chỉ</th>
                                <th>Số tầng hầm</th>
                                <th>Tên quản lý</th>
                                <th>Số điện thoại quản lý</th>
                                <th>Diện tích sàn</th>
                                <th>Diện tích trống</th>
                                <th>Diện tích thuê</th>
                                <th>Giá thuê</th>
                                <th>Phí dịch vụ</th>
                                <th>Phí môi giới</th>
                                <th>Thao tác</th>
                            </tr>
                            </thead>

                            <tbody>
                                <c:forEach var="item" items="${buildingList}">
                                    <tr>
                                        <td class="center">
                                            <label class="pos-rel">
                                                <input type="checkbox" name="checkList" value="${item.id}" class="ace">
                                                <span class="lbl"></span>
                                            </label>
                                        </td>
                                        <td class="center">
                                            ${item.name}
                                        </td>
                                        <td class="center">
                                            ${item.address}
                                        </td>
                                        <td class="center">
                                            ${item.numberOfBasement}
                                        </td>
                                        <td class="center">
                                            ${item.managerName}
                                        </td>
                                        <td class="center">
                                            ${item.managerPhone}
                                        </td>
                                        <td>${item.floorArea}</td>
                                        <td>${item.emptyArea}</td>
                                        <td>${item.rentArea}</td>
                                        <td>${item.rentPrice}</td>
                                        <td>${item.serviceFee}</td>
                                        <td>${item.brokerageFee}</td>

                                        <td>
                                            <div class="hidden-sm hidden-xs btn-group">
                                                <button class="btn btn-xs btn-success" title="Giao tòa nhà" onclick="assignmentBuilding(${item.id})">
                                                    <i class="ace-icon fa fa-check bigger-120"></i>
                                                </button>

                                                <a href="/admin/building-edit-${item.id}" class="btn btn-xs btn-info" title="Sửa tòa nhà">
                                                    <i class="ace-icon fa fa-pencil bigger-120"></i>
                                                </a>

                                                <button class="btn btn-xs btn-danger" title="Xóa tòa nhà" onclick="deleteBuilding(${item.id})">
                                                    <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div><!-- /.span -->
                </div>

            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->
</div><!-- /.main-container -->


<!-- Modal -->
<div class="modal fade" id="assignmentBuildingModal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Danh sách nhân viên</h4>
            </div>
            <div class="modal-body">
                <table class="table table-striped table-bordered table-hover" id="staffList">
                    <thead>
                        <tr>
                            <th class="center">Chọn</th>
                            <th class="center">Tên nhân viên</th>
                        </tr>
                    </thead>

                    <tbody>
<%--                    <tr>--%>
<%--                        <td class="center">--%>
<%--                            <input type="checkbox" id="checkbox_1" value="1">--%>
<%--                        </td>--%>

<%--                        <td class="center">--%>
<%--                            Nguyễn Văn A--%>
<%--                        </td>--%>

<%--                    </tr>--%>

                    </tbody>
                </table>
                <input type="hidden" id="buildingId" name="buildingId">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="btnAssignmentBuilding">Giao tòa nhà</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
            </div>
        </div>

    </div>
</div>

<script>
    $('#btnSearchBuilding').click((e)=>{
        e.preventDefault(); // tránh việc load nhầm api, ví dụ các đầu api giống nhau nhưng khác method
        $('#listForm').submit()
    })

    function assignmentBuilding(buildingId){
        $('#assignmentBuildingModal').modal();
        loadStaff(buildingId);
        $('#buildingId').val(buildingId); // gán hidden input có giá trị là buildingId
    }

    function loadStaff(buildingId){
        $.ajax({
            type: "GET",
            url: "http://localhost:8081/api/building/" + buildingId + "/staffs",
            data: JSON.stringify(buildingId),
            contentType: "application/json", //định nghĩa kiểu dữ liệu gửi đến server
            dataType: "JSON", //định nghĩa kiểu dữ liệu server gửi lại client
            success: (response) =>{
                let row = '';
                $.each(response.data, (index, item) => {
                   row += '<tr>';
                   row += '<td class="center">';
                   row += '<input type="checkbox" value=' + item.staffId+ " " + item.checked + '>';
                   row += '<td class="center">';
                   row += item.fullName;
                   row += '</td>';
                   row += '</td>';
                   row += '</tr>';
                });
                $('#staffList tbody').html(row);
                console.log("Success");
            },
            error: (respond) =>{
                console.log("Error");
                window.location.href = "/admin/building-list?message=error";
                console.log(respond);
            }
        })
    }

    $('#btnAssignmentBuilding').click((e) =>{
        e.preventDefault();
        let data = {};
        data['buildingId'] = $('#buildingId').val();
        let staffs = $('#staffList').find('tbody input[type = checkbox]:checked').map(function() {
            return $(this).val();
        }).get();
        data['staffs'] = staffs;
        if(data[staffs] != ''){
            assignment(data);
        }
        else{
            console.info("Need one user to be assigned")
        }
    })

    function assignment(data){
        $.ajax({
            type: "POST",
            url: "http://localhost:8081/api/building/assignment",
            data: JSON.stringify(data),
            contentType: "application/json", //định nghĩa kiểu dữ liệu gửi đến server
            dataType: "JSON", //định nghĩa kiểu dữ liệu server gửi lại client
            success: (response) =>{
                console.log("Success");
            },
            error: (respond) =>{
                console.info("Giao khong thanh cong");
                window.location.href = "/admin/building-list?message=error";
                console.log(respond);
            }
        })
    }

    function deleteBuilding(data){
        let buildingIds = [data];
        deleteBuildings(buildingIds);
    }

    $('#btnDeleteBuilding').click((e) =>{
        e.preventDefault();
        let buildingIds = $('#tableList').find('tbody input[type = checkbox]:checked').map(function() {
            return $(this).val();
        }).get();
        deleteBuildings(buildingIds);
    })

    function deleteBuildings(data){
        $.ajax({
            type: "Delete",
            url: "http://localhost:8081/api/building/" + data,
            data: JSON.stringify(data),
            contentType: "application/json", //định nghĩa kiểu dữ liệu gửi đến server
            dataType: "JSON", //định nghĩa kiểu dữ liệu server gửi lại client
            success: (respond) =>{
                console.log("Success")
            },
            error: (respond) =>{
                console.log("Error")
                console.log(respond)
            }
        })
    }
</script>
</body>
</html>
