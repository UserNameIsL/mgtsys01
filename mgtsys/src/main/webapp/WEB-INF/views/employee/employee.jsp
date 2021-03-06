<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>vip home system</title>
<meta name="description" content="欢迎使用vip之家系统">
<meta name="keywords" content="vip">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png" href="<%=request.getContextPath()%>/resources/img/favicon.png">
<link rel="apple-touch-icon-precomposed" href="<%=request.getContextPath()%>/resources/img/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="vip home system" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/amazeui.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/amazeui.datatables.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/app.css">
<script src="<%=request.getContextPath()%>/resources/js/common/echarts.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/common/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/common/angular.min.js"></script>
</head>

<body data-type="login" class="theme-black">
<div ng-app="myApp" ng-controller="loginCtr">
  <div ng-init="init()"></div>
  <ul>
    <li ng-repeat="employee in employeeList">
      <input type="radio" ng-model="$parent.employeeId"
       value="{{employee.employeeId}}"/>{{employee.employeeName}}
    </li>
  </ul>
  <!-- *******刘峻铭编辑star ********-->
  <div class="am-form-group">
    <button type="button" ng-click="doLogin()">确定</button>
  </div>
<!-- *******刘峻铭编辑 end********-->
</div>

<script>
var app = angular.module('myApp', []);
app.controller('loginCtr', function($scope, $http){
	$scope.init = function() {
	    $http.get("<%=request.getContextPath()%>/employee/getEmployeeList")
	        .then(function(response){
		        $scope.employeeList = response.data;
		        $scope.employeeId = response.data[0].employeeId;
		    });
	};
/********刘峻铭编辑star *********/
    $scope.doLogin = function() {
    	$http.post("<%=request.getContextPath()%>/employee/goEmployeeLogin?employeeId="+$scope.employeeId)
    	     .then(function(response){
		    window.location = "<%=request.getContextPath()%>/employee/employeeLogin";
	    });
    };
    
/********刘峻铭编辑 end*********/
});
</script>

</body>
</html>