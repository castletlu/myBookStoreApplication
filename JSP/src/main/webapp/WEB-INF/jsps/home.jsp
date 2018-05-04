<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
<html>
<head>
<title>Book Store</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/particles.js/2.0.0/particles.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.6.0/angular.min.js"></script>
<script src="/js/main.js"></script>
<link rel="stylesheet"	href="/css/bootstrap.css" />
<link href="/css/main.css" rel="stylesheet" type="text/css">
</head>
<div id="particles-js"></div>

<body>
<%
 if( session.getAttribute("flag")==null ) 
	{
		response.sendRedirect("login");
	}
%>
	<div  class="container" ng-app="app" ng-controller="MyController" style="width: 1600px;">		
		<h3 style="margin-left: 80%;"> <%= session.getAttribute( "theName" ) %> </h3> 
		
		<form  method="link" action="logout">
    	<input class ="logOutButton" type="submit" value="Log Out"/>
		</form>
		
		<a href="#create" id="openEdit" >Create New Book</a>
		<div style="margin-top: 40px;">	
		
		<input id="one" type="radio" name="stage" checked="checked" />
		<input id="two" type="radio" name="stage" />
		<input id="three" type="radio" name="stage" />
		<input id="four" type="radio" name="stage" />
		<input id="five" type="radio" name="stage" />
		<input id="six" type="radio" name="stage" />
			
		<div class="dropdown">
		<button type="button" data-toggle="dropdown">
		Choose one type of searching <span class="caret"></span>
		</button>
			<ul class="dropdown-menu">
				<li><label for="one">All</label></li>
				<li><label for="two">Edition</label></li>
				<li><label for="three">Categories</label></li>
				<li><label for="four">Title</label></li>
				<li><label for="five">Publisher</label></li>
				<li><label for="six">Author</label></li>
			</ul>
		</div>
		

 		
		<div class="panels">
			<div data-panel="one" ng-controller="getallcustomersController">
				<h3>List Books</h3>
 
				<button id="getAllBooks" ng-click="getBooksByPage()">Get All Books</button>
 
				<div data-panel="one" ng-show="showAllCustomers">
					<table class="list-group">
					<thead>
						<tr>
								<th>Id</th>
								<th>Title </th>
								<th>Author </th>
								<th>Categories </th>
								<th>Description</th>
								<th>Edition</th>
								<th>Pages</th>
								<th>Price</th>
								<th>Pubdate</th>
								<th>Publisher</th>
								<th>Edit</th>
								<th>Delete</th>
								
						</tr>
					</thead>
					<tbody>											
						<tr ng-repeat="book in books">
								<td> {{book.idbook}}</td>								
								<td> {{book.title}}</td>
								<td> {{book.author}}</td>
								<td> {{book.categories}}</td>
								<td> {{book.description}}</td>
								<td> {{book.edition}}</td>
								<td> {{book.pages}}</td>
								<td> {{book.price}}</td>
								<td> {{book.pubdate}}</td>
								<td> {{book.publisher}}</td>
								<td> <a href="#edit" id="openEdit" ng-click="save(book.idbook)">Edit</a></td>
								<td> <a href="#delete" id="openDelete" ng-click="save(book.idbook)">Delete</a></td>	
						</tr>						
					</tbody>
					<tfoot>
					<tr>
					<button ng-click="backPageAll()" ng-hide="hideBack">Back</button>
					<span style="color: white; margin-left:  5px; margin-right:  5px; ">{{currentPageAll}}</span>
					<button ng-click="nextPageAll()" ng-hide="hideNext">Next</button>
					</tr>
					</tfoot>			
					</table>					
				</div>				
								
			</div>
 
			<div data-panel="two" ng-controller="findByEdition" >
				<h3>List Books Were Found By Edition</h3>
 
				<input type="text" class="form-control" style="width: 100px;" ng-model="edition" /><br />
				<button ng-click="getBooksByEdition()">Get Books</button>
 
				<div data-panel="two" ng-show="showBooksByEdition"> 
					<table class="list-group">
						<tr>
								<th>Id </th>
								<th>Title </th>
								<th>Author </th>
								<th>Categories </th>
								<th>Description</th>
								<th>Edition</th>
								<th>Pages</th>
								<th>Price</th>
								<th>Pubdate</th>
								<th>Publisher</th>
								<th>Edit</th>
								<th>Delete</th>
								
						</tr>
						<tr ng-repeat="book in books">
								<td> {{book.idbook}}</td>								
								<td> {{book.title}}</td>
								<td> {{book.author}}</td>
								<td> {{book.categories}}</td>
								<td> {{book.description}}</td>
								<td> {{book.edition}}</td>
								<td> {{book.pages}}</td>
								<td> {{book.price}}</td>
								<td> {{book.pubdate}}</td>
								<td> {{book.publisher}}</td>
								<td> <a href="#edit" id="openEdit" ng-click="save(book.idbook)">Edit</a></td>
								<td> <a href="#delete" id="openDelete" ng-click="save(book.idbook)">Delete</a></td>	
						</tr>
						<tfoot>
					<tr>
					<button ng-click="backPageAll()" ng-hide="hideBack">Back</button>
					<span style="color: white; margin-left:  5px; margin-right:  5px; ">{{currentPageAll}}</span>
					<button ng-click="nextPageAll()" ng-hide="hideNext">Next</button>
					</tr>
					</tfoot>
					</table>		
				</div>
			</div>
 
			<div data-panel="three" ng-controller="findByCategories">
				<h3>List Books Were Found By Categories</h3>
 
				<input type="text" class="form-control" style="width: 100px;" ng-model="categories" /><br />
				<button ng-click="getBooksByCategories()">Get Books</button>
 
				<div data-panel="three" ng-show="showBooksByCategories"> 
					<table class="list-group">
						<tr>
								<th>Id </th>
								<th>Title </th>
								<th>Author </th>
								<th>Categories </th>
								<th>Description</th>
								<th>Edition</th>
								<th>Pages</th>
								<th>Price</th>
								<th>Pubdate</th>
								<th>Publisher</th>
								<th>Edit</th>
								<th>Delete</th>
								
						</tr>
						<tr ng-repeat="book in books">
								<td> {{book.idbook}}</td>								
								<td> {{book.title}}</td>
								<td> {{book.author}}</td>
								<td> {{book.categories}}</td>
								<td> {{book.description}}</td>
								<td> {{book.edition}}</td>
								<td> {{book.pages}}</td>
								<td> {{book.price}}</td>
								<td> {{book.pubdate}}</td>
								<td> {{book.publisher}}</td>
								<td> <a href="#edit" id="openEdit" ng-click="save(book.idbook)">Edit</a></td>
								<td> <a href="#delete" id="openDelete" ng-click="save(book.idbook)">Delete</a></td>	
						</tr>
						<tfoot>
					<tr>
					<button ng-click="backPageAll()" ng-hide="hideBack">Back</button>
					<span style="color: white; margin-left:  5px; margin-right:  5px; ">{{currentPageAll}}</span>
					<button ng-click="nextPageAll()" ng-hide="hideNext">Next</button>
					</tr>
					</tfoot>
					</table>		
				</div>
			</div>
			
			<div data-panel="four" ng-controller="findByTitle" >
				<h3>List Books Were Found By Title</h3>
 
				<input type="text" class="form-control" style="width: 100px;" ng-model="title" /><br />
				<button ng-click="getBooksByTitle()">Get Books</button>
 
				<div data-panel="four" ng-show="showBooksByTitle"> 
					<table class="list-group">
						<tr>
								<th>Id </th>
								<th>Title </th>
								<th>Author </th>
								<th>Categories </th>
								<th>Description</th>
								<th>Edition</th>
								<th>Pages</th>
								<th>Price</th>
								<th>Pubdate</th>
								<th>Publisher</th>
								<th>Edit</th>
								<th>Delete</th>
								
						</tr>
						<tr ng-repeat="book in books">
								<td> {{book.idbook}}</td>								
								<td> {{book.title}}</td>
								<td> {{book.author}}</td>
								<td> {{book.categories}}</td>
								<td> {{book.description}}</td>
								<td> {{book.edition}}</td>
								<td> {{book.pages}}</td>
								<td> {{book.price}}</td>
								<td> {{book.pubdate}}</td>
								<td> {{book.publisher}}</td>
								<td> <a href="#edit" id="openEdit" ng-click="save(book.idbook)">Edit</a></td>
								<td> <a href="#delete" id="openDelete" ng-click="save(book.idbook)">Delete</a></td>	
						</tr>
						<tfoot>
					<tr>
					<button ng-click="backPageAll()" ng-hide="hideBack">Back</button>
					<span style="color: white; margin-left:  5px; margin-right:  5px; ">{{currentPageAll}}</span>
					<button ng-click="nextPageAll()" ng-hide="hideNext">Next</button>
					</tr>
					</tfoot>
					</table>			
				</div>
			</div>
			
			<div data-panel="five" ng-controller="findByPublisher">
				<h3>List Books Were Found By Publisher</h3>
 
				<input type="text" class="form-control" style="width: 100px;" ng-model="publisher" /><br />
				<button ng-click="getBooksByPublisher()">Get Books</button>
 
				<div data-panel="five" ng-show="showBooksByPublisher"> 
					<table class="list-group">
						<tr>
								<th>Id </th>
								<th>Title </th>
								<th>Author </th>
								<th>Categories </th>
								<th>Description</th>
								<th>Edition</th>
								<th>Pages</th>
								<th>Price</th>
								<th>Pubdate</th>
								<th>Publisher</th>
								<th>Edit</th>
								<th>Delete</th>
								
						</tr>
						<tr ng-repeat="book in books">
								<td> {{book.idbook}}</td>								
								<td> {{book.title}}</td>
								<td> {{book.author}}</td>
								<td> {{book.categories}}</td>
								<td> {{book.description}}</td>
								<td> {{book.edition}}</td>
								<td> {{book.pages}}</td>
								<td> {{book.price}}</td>
								<td> {{book.pubdate}}</td>
								<td> {{book.publisher}}</td>
								<td> <a href="#edit" id="openEdit" ng-click="save(book.idbook)">Edit</a></td>
								<td> <a href="#delete" id="openDelete" ng-click="save(book.idbook)">Delete</a></td>	
						</tr>
						<tfoot>
					<tr>
					<button ng-click="backPageAll()" ng-hide="hideBack">Back</button>
					<span style="color: white; margin-left:  5px; margin-right:  5px; ">{{currentPageAll}}</span>
					<button ng-click="nextPageAll()" ng-hide="hideNext">Next</button>
					</tr>
					</tfoot>
					</table>			
				</div>
			</div>
			
			<div data-panel="six" ng-controller="findByAuthor">
				<h3>List Books Were Found By Author</h3>
 
				<input type="text" class="form-control" style="width: 100px;" ng-model="author" /><br />
				<button ng-click="getBooksByAuthor()">Get Books</button>
 
				<div data-panel="six" ng-show="showBooksByAuthor"> 
					<table class="list-group">
						<tr>
								<th>Id </th>
								<th>Title </th>
								<th>Author </th>
								<th>Categories </th>
								<th>Description</th>
								<th>Edition</th>
								<th>Pages</th>
								<th>Price</th>
								<th>Pubdate</th>
								<th>Publisher</th>
								<th>Edit</th>
								<th>Delete</th>
								
						</tr>
						<tr ng-repeat="book in books">
								<td> {{book.idbook}}</td>								
								<td> {{book.title}}</td>
								<td> {{book.author}}</td>
								<td> {{book.categories}}</td>
								<td> {{book.description}}</td>
								<td> {{book.edition}}</td>
								<td> {{book.pages}}</td>
								<td> {{book.price}}</td>
								<td> {{book.pubdate}}</td>
								<td> {{book.publisher}}</td>
								<td> <a href="#edit" id="openEdit" ng-click="save(book.idbook)">Edit</a></td>
								<td> <a href="#delete" id="openDelete" ng-click="save(book.idbook)">Delete</a></td>	
						</tr>
						<tfoot>
					<tr>
					<button ng-click="backPageAll()" ng-hide="hideBack">Back</button>
					<span style="color: white; margin-left:  5px; margin-right:  5px; ">{{currentPageAll}}</span>
					<button ng-click="nextPageAll()" ng-hide="hideNext">Next</button>
					</tr>
					</tfoot>
					</table>			
				</div>
			</div>
	</div>	
	</div>
	
					<aside id="create" class="popup">
				<div  class="popUpContainer">
					<header> <a href="#!"
						class="closePopUp">X</a>
					<h3>
						Creating!
						</h4>
					</header>
					<div  class="contentPopup row">
						<div  class="col-md-1"></div>
						<div ng-controller="postController"
							class="col-md-10">
							<form name="customerForm" ng-submit="submitForm()"
								onsubmit="location.href='#!'">
								<label>Title</label> <input
									type="text" name="title" class="form-control" ng-model="title" />
								<label>Author</label> <input type="text" name="author"
									class="form-control" ng-model="author" /> <label>Categories</label>
								<input type="text" name="categories" class="form-control"
									ng-model="categories" /> <label>Description</label> <input
									type="text" name="description" class="form-control"
									ng-model="description" /> <label>Edition</label> <input
									type="text" name="edition" class="form-control"
									ng-model="edition" /> <label>Pages</label> <input type="text"
									name="pages" class="form-control" ng-model="pages" /> <label>Price</label>
								<input type="text" name="price" class="form-control"
									ng-model="price" /> <label>Pubdate</label> <input type="text"
									name="pubdate" class="form-control" ng-model="pubdate" /> <label>Publisher</label>
								<input type="text" name="publisher" class="form-control"
									ng-model="publisher" /> <br />
								<button type="submit">Create</button>
							</form>
						</div>
						<div class="col-md-1"></div>


					</div>
				</div>
				</aside>
	
	
	
	
	
	
	
	
				<aside id="edit" class="popup">
				<div  class="popUpContainer">
					<header> <a href="#!"
						class="closePopUp">X</a>
					<h3>
						Editing!
						</h4>
					</header>
					<div " class="contentPopup row">
						<div  class="col-md-1"></div>
						<div  ng-controller="editController"
							class="col-md-10">
							<form name="customerForm" ng-submit="submitForm()"
								onsubmit="location.href='#!'">
								<label>Title</label> <input
									type="text" name="title" class="form-control" ng-model="title" />
								<label>Author</label> <input type="text" name="author"
									class="form-control" ng-model="author" /> <label>Categories</label>
								<input type="text" name="categories" class="form-control"
									ng-model="categories" /> <label>Description</label> <input
									type="text" name="description" class="form-control"
									ng-model="description" /> <label>Edition</label> <input
									type="text" name="edition" class="form-control"
									ng-model="edition" /> <label>Pages</label> <input type="text"
									name="pages" class="form-control" ng-model="pages" /> <label>Price</label>
								<input type="text" name="price" class="form-control"
									ng-model="price" /> <label>Pubdate</label> <input type="text"
									name="pubdate" class="form-control" ng-model="pubdate" /> <label>Publisher</label>
								<input type="text" name="publisher" class="form-control"
									ng-model="publisher" /> <br />
								<button type="submit">Save Edit</button>
							</form>
						</div>
						<div class="col-md-1"></div>


					</div>
				</div>
				</aside>







				<aside id="delete" class="popup">
   					 <div class="popUpContainer">
      					 <header>
      						  <a href="#!" class="closePopUp">X</a>
      					  <h3>Delete!</h4> 
      					 </header> 
   							 <div class="contentPopup row">
   							 	<div class="col-md-1"></div>
   							 	<div ng-controller="deleteController" class="col-md-10">
      	 						<h4>Are u sure ?</h4><br />
								<button ng-click="deleteBookByID()"  onclick="location.href='#!'">Confirm</button>
								</div>	
      	 						<div class="col-md-1"></div>	
   			  				 </div>
 				  </div>        
  				</aside>
  				
  			
	</div>
	
	
</body>
</html>