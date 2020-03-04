<%@page language="java" pageEncoding="ISO-8859-1"
	contentType="text/html; ISO-8859-1" isELIgnored="false"%>
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">

<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1css/bootstrap.min.css">   -->
<script>
function hideAddNewsForm(newsId){
	var divId= "dataDiv_"+newsId;
	var text= document.getElementById(divId).innerHTML;
	var addForm = document.getElementById("saveNewsForm");
	addForm.hidden=true;
	var fields = text.split(',');
	var updateForm = document.getElementById("updateNewsForm");
	updateForm.hidden=false;
	document.getElementById('newsId').value = fields[0];
	document.getElementById('newsName').value = fields[1];
	document.getElementById('newsAuthor').value = fields[2];
	document.getElementById('newsDesc').value = fields[3];
	document.getElementById('newsContent').value = fields[4];
}
</script>
</head>
<body>

<div class="container" align="center">

<h2> News Application</h2>

<form id="saveNewsForm" name=form method=POST action="add" modelAttribute="news">  
 
    <div class="form-group">  
      <label class="control-label col-sm-2" for="title">News Name :</label>  
      <div class="col-sm-10">  
        <input type="text" class="form-control"   name="name">  
      </div>  
    </div>   
    
    <div class="form-group">  
      <label class="control-label col-sm-2" for="titel">Author Name :</label>  
      <div class="col-sm-10">  
        <input type="text" class="form-control" name="author">  
      </div>  
    </div> 
     
   <div class="form-group">  
      <label class="control-label col-sm-2" for="title">News Description :</label>  
      <div class="col-sm-10">  
        <input type="text" class="form-control" name="description">  
      </div>  
    </div> 
    
    <div class="form-group">  
      <label class="control-label col-sm-2" for="titel">News Content :</label>  
      <div class="col-sm-10">  
        <input type="text" class="form-control"  name="content">  
      </div>  
    </div> 
<br>
  <button type="submit" id="submitButton" class="btn btn-success">Add News</button>  

</form>
<form id="updateNewsForm" name=form1 method=PUT action="update" modelAttribute="news" hidden=true>  

<div class="form-group" style="display:none">  
      <label class="control-label col-sm-2" for="title">News Id :</label>  
      <div class="col-sm-10">  
        <input type="text" id= "newsId" class="form-control"   name="newsId">
      </div>  
    </div>
 
    <div class="form-group">  
      <label class="control-label col-sm-2" for="title">News Name :</label>  
      <div class="col-sm-10">  
        <input type="text" id= "newsName" class="form-control"   name="name">
      </div>  
    </div>   
    
    <div class="form-group">  
      <label class="control-label col-sm-2" for="titel">Author Name :</label>  
      <div class="col-sm-10">  
        <input type="text" id= "newsAuthor" class="form-control" name="author">  
      </div>  
    </div> 
     
   <div class="form-group">  
      <label class="control-label col-sm-2" for="title">News Description :</label>  
      <div class="col-sm-10">  
        <input type="text" id= "newsDesc" class="form-control" name="description">  
      </div>  
    </div> 
    
    <div class="form-group">  
      <label class="control-label col-sm-2" for="titel">News Content :</label>  
      <div class="col-sm-10">  
        <input type="text" id= "newsContent" class="form-control"  name="content">  
      </div>  
    </div> 
<br>
  <button type="submit" id="updateButton" class="btn btn-success">Update News</button>  

</form>

<h4>News Details</h4>

<div>
 <table class="table" border="2">
		<tr style="font-weight: bold">
			<td>NewsId</td>
			<td>Name</td>
			<td>Author</td>
			<td>Description</td>
			<td>Content </td>
			<td>Published At </td>
			<td>Action </td>
		</tr>
		
		<c:forEach var="allNews" items="${newsList}">
		
		
			<tr>
			<div id="dataDiv_${allNews.newsId}" style="display:none">${allNews.newsId},${allNews.name},${allNews.author},${allNews.description},${allNews.content}</div>
				<td>${allNews.newsId}</td>
				<td>${allNews.name}</td>
				<td>${allNews.author}</td>
				<td>${allNews.description}</td>
				<td>${allNews.content}</td>
				<td>${allNews.publishedAt}</td>
				<td><a href="#" id="btn111" onclick ="hideAddNewsForm(${allNews.newsId})">Update</a></td>
				<td><a href="delete?newsId=${allNews.newsId}">Delete</a></td>
				
			</tr>
			
		</c:forEach>
	</table>
	</div>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>  
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>  

	<!-- Create a form which will have text boxes for News ID, title, author,description, content
		 along with a Send button. Handle errors like empty fields -->

	<!-- display all existing news in a tabular structure with News ID, title, author,description,content
		publishedAt and Action(delete button) -->
</body>
</html>