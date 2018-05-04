'use strict';
var app = angular.module('app', [])
	.controller('MyController', function($scope){
		
		
		
		$scope.callReloadAll = function() {
	        $rootScope.$emit("reloadAll", {});
	    }
		
		$scope.value = false;
		$scope.save = function(argument) {
	         $scope.value = argument;	         
	      }
		
		$scope.currentPageAll = 1;
		$scope.hideNext = false;
		$scope.empty = [];
		$scope.hideBack = true;
		
		

		//back ground
		particlesJS("particles-js", {
			  particles: {
			    number: {
			      value: 150,
			      density: {
			        enable: true,
			        value_area: 800
			      }
			    },
			    color: {
			      value: "#e37575"
			    },
			    shape: {
			      type: "circle",
			      stroke: {
			        width: 0,
			        color: "#e37575"
			      },
			      polygon: {
			        nb_sides: 5
			      },
			      image: {
			        src: "img/github.svg",
			        width: 100,
			        height: 100
			      }
			    },
			    opacity: {
			      value: 0.5,
			      random: false,
			      anim: {
			        enable: false,
			        speed: 1,
			        opacity_min: 0.1,
			        sync: false
			      }
			    },
			    size: {
			      value: 3,
			      random: true,
			      anim: {
			        enable: false,
			        speed: 1,
			        size_min: 0.1,
			        sync: false
			      }
			    },
			    line_linked: {
			      enable: true,
			      distance: 150,
			      color: "#e37575",
			      opacity: 0.4,
			      width: 1
			    },
			    move: {
			      enable: true,
			      speed: 2,
			      direction: "none",
			      random: false,
			      straight: false,
			      out_mode: "out",
			      bounce: false,
			      attract: {
			        enable: false,
			        rotateX: 600,
			        rotateY: 1200
			      }
			    }
			  },
			  interactivity: {
			    detect_on: "canvas",
			    events: {
			      onhover: {
			        enable: true,
			        mode: "grab"
			      },
			      onclick: {
			        enable: true,
			        mode: "push"
			      },
			      resize: true
			    },
			    modes: {
			      grab: {
			        distance: 140,
			        line_linked: {
			          opacity: 1
			        }
			      },
			      bubble: {
			        distance: 400,
			        size: 40,
			        duration: 2,
			        opacity: 8,
			        speed: 3
			      },
			      repulse: {
			        distance: 200,
			        duration: 0.4
			      },
			      push: {
			        particles_nb: 4
			      },
			      remove: {
			        particles_nb: 2
			      }
			    }
			  },
			  retina_detect: true
			});


		
		
		
		
		
		
		
		
	});






app.controller('getallcustomersController', function($scope, $http, $rootScope) {
	
	$rootScope.$on("reloadAll", function(){
        $scope.getAllCustomers();
     });
	$scope.showAllCustomers = false;
	
 
	$scope.getAllCustomers = function() {

 
		$http.get("http://localhost:8080/book").then(function(response) {
 				$scope.books = response.data;
				$scope.showAllCustomers = true;
 		
		}, function(response) {
			$scope.getResultMessage = "Fail! o day";
		});
 
	}
	
	$scope.getBooksByPage = function(){
		var url = "http://localhost:8080/book/findByPage";
		 
		var config = {
			headers : {	'Content-Type' : 'application/json;charset=utf-8;' },
		
			params: { 'pageSize' : 10, 'pageNumber': $scope.currentPageAll}
		}
 
		$http.get(url, config).then(function(response) {
 			
				$scope.books = response.data;
				if (Object.keys(response.data).length==0)
					{
					$scope.hideNext = true;;
					}
				$scope.showAllCustomers = true;
 			 
		}, function(response) {
			$scope.hideNext = true;
		});
		
	}
	
	
	$scope.nextPageAll = function(){
		$scope.currentPageAll = $scope.currentPageAll + 1;
		$scope.getBooksByPage();
		$scope.hideBack=false;
	}
	
	$scope.backPageAll = function(){
		$scope.currentPageAll = $scope.currentPageAll - 1;		
		$scope.getBooksByPage();
		$scope.hideNext=false;
		if ($scope.currentPageAll == 1)
			{
				$scope.hideBack=true;
			}
	}
	
	
});




 
app.controller('postController', function($scope, $http, $rootScope) {
	
	
	$scope.submitForm = function(){
			
		var data = {
				
				title: $scope.title,
				author: $scope.author,				
				categories: $scope.categories,
				description: $scope.description,
				edition: $scope.edition,
				pages: $scope.pages,
				price: $scope.price,
				pubdate: $scope.pubdate,
				publisher: $scope.publisher
        };
		
		
		$http.post("http://localhost:8080/book", data).then(function (response) {
			$scope.postResultMessage = "Sucessful!";
		}, function (response) {
			$scope.postResultMessage = "Fail!";
		});
		
		
		$scope.title = "";
		$scope.author = "";
		$scope.categories = "";
		$scope.description = "";
		$scope.edition = "";
		$scope.pages = "";
		$scope.price = "";
		$scope.pubdate = "";
		$scope.publisher = "";
	}
});


 

 
app.controller('findByEdition', function($scope, $http) {
	
	$scope.showBooksByEdition = false;
	
	$scope.getBooksByEdition = function() {
		var url = "http://localhost:8080/book/findByEdition";
 
		var config = {
			headers : {	'Content-Type' : 'application/json;charset=utf-8;' },
		
			params: { 'edition' : $scope.edition, 'pageSize' : 10, 'pageNumber': $scope.currentPageAll }
		}
 
		$http.get(url, config).then(function(response) {
 			
				$scope.books = response.data;
				if (Object.keys(response.data).length==0)
				{
				$scope.hideNext = true;;
				}
				$scope.showBooksByEdition = true;
 			 
		}, function(response) {
			$scope.getResultMessage = "Fail!";
		});
 
	}
	
	$scope.nextPageAll = function(){
		$scope.currentPageAll = $scope.currentPageAll + 1;
		$scope.getBooksByEdition();
		$scope.hideBack=false;
	}
	
	$scope.backPageAll = function(){
		$scope.currentPageAll = $scope.currentPageAll - 1;
		$scope.getBooksByEdition();
		$scope.hideNext=false;
		if ($scope.currentPageAll == 1)
		{
			$scope.hideBack=true;
		}
	}
	
	
	
});


app.controller('findByTitle', function($scope, $http) {
	
	$scope.showBooksByTitle = false;
	
	$scope.getBooksByTitle = function() {
		var url = "http://localhost:8080/book/findByTitle";
 
		var config = {
			headers : {	'Content-Type' : 'application/json;charset=utf-8;' },
		
			params: { 'title' : $scope.title, 'pageSize' : 10, 'pageNumber': $scope.currentPageAll }
		}
 
		$http.get(url, config).then(function(response) {
 			
				$scope.books = response.data;
				if (Object.keys(response.data).length==0)
				{
				$scope.hideNext = true;;
				}
				$scope.showBooksByTitle = true;
 			 
		}, function(response) {
			$scope.getResultMessage = "Fail!";
		});
 
	}
	
	
	$scope.nextPageAll = function(){
		$scope.currentPageAll = $scope.currentPageAll + 1;
		$scope.getBooksByTitle();
		$scope.hideBack=false;
	}
	
	$scope.backPageAll = function(){
		$scope.currentPageAll = $scope.currentPageAll - 1;
		$scope.getBooksByTitle();
		$scope.hideNext=false;
		if ($scope.currentPageAll == 1)
		{
			$scope.hideBack=true;
		}
	}
	
	
});



app.controller('findByCategories', function($scope, $http) {
	
	$scope.showBooksByCategories = false;
	
	$scope.getBooksByCategories = function() {
		var url = "http://localhost:8080/book/findByCategories";
 
		var config = {
			headers : {	'Content-Type' : 'application/json;charset=utf-8;' },
		
			params: { 'categories' : $scope.categories, 'pageSize' : 10, 'pageNumber': $scope.currentPageAll }
		}
 
		$http.get(url, config).then(function(response) {
 			
				$scope.books = response.data;
				if (Object.keys(response.data).length==0)
				{
				$scope.hideNext = true;;
				}
				$scope.showBooksByCategories = true;
 			 
		}, function(response) {
			$scope.getResultMessage = "Fail!";
		});
 
	}
	
	
	
	$scope.nextPageAll = function(){
		$scope.currentPageAll = $scope.currentPageAll + 1;
		$scope.getBooksByCategories();
		$scope.hideBack=false;
	}
	
	$scope.backPageAll = function(){
		$scope.currentPageAll = $scope.currentPageAll - 1;
		$scope.getBooksByCategories();
		$scope.hideNext=false;
		if ($scope.currentPageAll == 1)
		{
			$scope.hideBack=true;
		}
	}
	
	
});


app.controller('findByPublisher', function($scope, $http) {
	
	$scope.showBooksByPublisher = false;
	
	$scope.getBooksByPublisher = function() {
		var url = "http://localhost:8080/book/findByPublisher";
 
		var config = {
			headers : {	'Content-Type' : 'application/json;charset=utf-8;' },
		
			params: { 'publisher' : $scope.publisher, 'pageSize' : 10, 'pageNumber': $scope.currentPageAll }
		}
 
		$http.get(url, config).then(function(response) {
 			
				$scope.books = response.data;
				if (Object.keys(response.data).length==0)
				{
				$scope.hideNext = true;;
				}
				$scope.showBooksByPublisher = true;
 			 
		}, function(response) {
			$scope.getResultMessage = "Fail!";
		});
 
	}
	
	
	
	$scope.nextPageAll = function(){
		$scope.currentPageAll = $scope.currentPageAll + 1;
		$scope.getBooksByPublisher();
		$scope.hideBack=false;
	}
	
	$scope.backPageAll = function(){
		$scope.currentPageAll = $scope.currentPageAll - 1;
		$scope.getBooksByPublisher();
		$scope.hideNext=false;
		if ($scope.currentPageAll == 1)
		{
			$scope.hideBack=true;
		}
	}
	
});


app.controller('findByAuthor', function($scope, $http) {
	
	$scope.showBooksByAuthor = false;
	
	$scope.getBooksByAuthor = function() {
		var url = "http://localhost:8080/book/findByAuthor";
 
		var config = {
			headers : {	'Content-Type' : 'application/json;charset=utf-8;' },
		
			params: { 'author' : $scope.author, 'pageSize' : 10, 'pageNumber': $scope.currentPageAll }
		}
 
		$http.get(url, config).then(function(response) {
 			
				$scope.books = response.data;
				$scope.showBooksByAuthor = true;
 			 
		}, function(response) {
			$scope.getResultMessage = "Fail!";
		});
 
	}
	
	
	
	$scope.nextPageAll = function(){
		$scope.currentPageAll = $scope.currentPageAll + 1;
		$scope.getBooksByAuthor();
		$scope.hideBack=false;
	}
	
	$scope.backPageAll = function(){
		$scope.currentPageAll = $scope.currentPageAll - 1;
		$scope.getBooksByAuthor();
		$scope.hideNext=false;
		if ($scope.currentPageAll == 1)
		{
			$scope.hideBack=true;
		}
	}
});




app.controller('editController', function($scope, $http) {
	$scope.submitForm = function(){
			
		var data = {
				idbook: $scope.value,
				title: $scope.title,
				author: $scope.author,				
				categories: $scope.categories,
				description: $scope.description,
				edition: $scope.edition,
				pages: $scope.pages,
				price: $scope.price,
				pubdate: $scope.pubdate,
				publisher: $scope.publisher
        };
		
		
		$http.put("http://localhost:8080/book", data).then(function (response) {
			$scope.postResultMessage = "Sucessful!";
		}, function (response) {
			$scope.postResultMessage = "Fail!";
		});
				
		$scope.title = "";
		$scope.author = "";
		$scope.categories = "";
		$scope.description = "";
		$scope.edition = "";
		$scope.pages = "";
		$scope.price = "";
		$scope.pubdate = "";
		$scope.publisher = "";
	}
});



app.controller('deleteController', function($scope, $http) {
	$scope.deleteBookByID = function() {
		 
		$http.delete("http://localhost:8080/book/"+$scope.value).then(function(response) {
 			
				$scope.getResultMessage = "Deleted!";
			 
			}, function(response) {
				$scope.getResultMessage = "Fail!";
			});
		
	}
});






//multi page jquerry
$('.form .stages label').click(function() {
	var radioButtons = $('.form input:radio');
	var selectedIndex = radioButtons.index(radioButtons.filter(':checked'));
	selectedIndex = selectedIndex + 1;
});






