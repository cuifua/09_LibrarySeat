<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>${siteName!""}|学生管理-编辑学生</title>
<#include "../common/header.ftl"/>

</head>
  
<body>
<div class="lyear-layout-web">
  <div class="lyear-layout-container">
    <!--左侧导航-->
    <aside class="lyear-layout-sidebar">
      
      <!-- logo -->
      <div id="logo" class="sidebar-header">
        <a href="index.html"><img src="/admin/images/logo-sidebar.jpg" title="${siteName!""}" alt="${siteName!""}" /></a>
      </div>
      <div class="lyear-layout-sidebar-scroll"> 
        <#include "../common/left-menu.ftl"/>
      </div>
      
    </aside>
    <!--End 左侧导航-->
    
    <#include "../common/header-menu.ftl"/>
    
     <!--页面主要内容-->
    <main class="lyear-layout-content">
      
      <div class="container-fluid">
        
        <div class="row">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-header"><h4>编辑学生</h4></div>
              <div class="card-body">
                <form action="add" id="user-add-form" method="post" class="row">
                  <input type="hidden" name="id" value="${student.id}">
                  <div class="form-group col-md-12">
                    <label>头像上传</label>
                    <div class="form-controls">
                      <ul class="list-inline clearfix lyear-uploads-pic">
                        <li class="col-xs-4 col-sm-3 col-md-2">
                          <figure>
                            <#if student.user.headPic?length gt 0>
                    		<img src="/photo/view?filename=${student.user.headPic}" id="show-picture-img">
                    		<#else>
                    		<img src="/admin/images/default-head.jpg" id="show-picture-img" alt="默认头像">
                    		</#if>
                          </figure>
                        </li>
                        <input type="hidden" name="user.headPic" id="headPic" value="${student.user.headPic}">
                        <input type="file" id="select-file" style="display:none;" onchange="upload('show-picture-img','headPic')">
                        <li class="col-xs-4 col-sm-3 col-md-2">
                          <a class="pic-add" id="add-pic-btn" href="javascript:void(0)" title="点击上传"></a>
                        </li>
                      </ul>
                    </div>
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">昵称</span>
                    <input type="text" class="form-control required" id="nickName" name="user.nickName" value="${student.user.nickName!""}" placeholder="请输入昵称" tips="请填写昵称" />
                  </div>

                  <div class="input-group m-b-10">
                    <span class="input-group-addon">手机号码</span>
                    <input type="tel" class="form-control" id="mobile" name="user.mobile" value="${student.user.mobile!""}" />
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">邮箱账号</span>
                    <input type="email" class="form-control" id="email" name="user.email" value="${student.user.email!""}" />
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">生日</span>
                    <input type="date" class="form-control" id="birthday" name="studentBirthday" value="${student.studentBirthday?date}" />
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">所属班级</span>
                    <select name="clazz.id" class="form-control" id="clazz">
                              <#if clazzs?size gt 0>
                                  <#list clazzs as clazz>
                                      <option value="${clazz.id}"
                                        <#if student.clazz.id == clazz.id>  selected="selected" </#if>
                                      >${clazz.claname}</option>
                                  </#list>
                              </#if>
                    </select>
                  </div>

                  <div class="input-group" style="margin-top:15px;margin-bottom:15px;padding-left:25px;">
                    性别：
                    <label class="lyear-radio radio-inline radio-primary" style="margin-left:30px;">
                    <input type="radio" name="user.sex" value="1" <#if student.user.sex == 1> checked </#if> >
                    <span>男</span>
                    <label class="lyear-radio radio-inline radio-primary">
                    <input type="radio" name="user.sex" value="2" <#if student.user.sex == 2> checked </#if>>
                    <span>女</span>
                    <label class="lyear-radio radio-inline radio-primary">
                    <input type="radio" name="user.sex" value="0" <#if student.user.sex == 0> checked </#if>>
                    <span>未知</span>
                  </label>


                  </div>
                  <div class="input-group" style="margin-top:15px;margin-bottom:15px;padding-left:25px;">
                    状态：
                    <label class="lyear-radio radio-inline radio-primary" style="margin-left:30px;">
                    <input type="radio" name="user.status" value="1" <#if student.user.status == 1> checked </#if>>
                    <span>正常</span>
                    <label class="lyear-radio radio-inline radio-primary">
                    <input type="radio" name="user.status" value="0" <#if student.user.status == 0> checked </#if>>
                    <span>冻结</span>
                  </label>
                  </div>
                  <div class="form-group col-md-12">
                    <button type="button" class="btn btn-primary ajax-post" id="add-form-submit-btn">确 定</button>
                    <button type="button" class="btn btn-default" onclick="javascript:history.back(-1);return false;">返 回</button>
                  </div>
                </form>
       
              </div>
            </div>
          </div>
          
        </div>
        
      </div>
      
    </main>
    <!--End 页面主要内容-->
  </div>
</div>
<#include "../common/footer.ftl"/>
<script type="text/javascript" src="/admin/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="/admin/js/main.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
      //提交按钮监听事件
      $("#add-form-submit-btn").click(function(){
          var  mobile=$("#mobile").val();
          var ePattern = /^1[0-9]{10}$/;
          if (!ePattern.test(mobile)){
              showErrorMsg("手机格式错误");
              return;
          }

          var  email=$("#email").val();
          var ePattern = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
          if (!ePattern.test(email)){
              showErrorMsg("邮箱格式错误");
              return;
          }
          if ($("#birthday").val()==""){
              showErrorMsg("请选择生日日期");
              return;
          }

          if(!checkForm("user-add-form")){
			return;
		}
		var data = $("#user-add-form").serialize();
		$.ajax({
			url:'add',
			type:'POST',
			data:data,
			dataType:'json',
			success:function(data){
				if(data.code == 0){
					showSuccessMsg('学生编辑成功!',function(){
						window.location.href = 'list';
					})
				}else{
					showErrorMsg(data.msg);
				}
			},
			error:function(data){
				alert('网络错误!');
			}
		});
	});
	//监听上传图片按钮
	$("#add-pic-btn").click(function(){
		$("#select-file").click();
	});
});
</script>
</body>
</html>