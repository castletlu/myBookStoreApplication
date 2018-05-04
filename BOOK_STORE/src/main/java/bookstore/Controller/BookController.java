package bookstore.Controller;

import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import bookstore.DAO.BookRepository;
import bookstore.DAOimpl.BookService;
import bookstore.Model.Book;

@RestController
@RequestMapping("book")
public class BookController {


	@Autowired
	BookService bookServices;
	
	@Autowired
	BookRepository bookRepository;
	
	@CrossOrigin(origins = "*") 
	@PostMapping
	public ResponseEntity<Book> create (@RequestBody Book book)
	{
		
		bookServices.create(book.getAuthor(), book.getCategories(), book.getDescription(), book.getEdition(), book.getPages(), book.getPrice(), book.getPubdate(), book.getPublisher(), book.getTitle());
		return new ResponseEntity<Book> (book,HttpStatus.CREATED);
	}

	
	@CrossOrigin(origins = "*") 
	@PutMapping
	public ResponseEntity<Book> update(@RequestBody Book book)
	{
		bookServices.update(book);
		return new ResponseEntity<Book>(book,HttpStatus.OK);
	}
	
	@CrossOrigin(origins = "*") 
	@DeleteMapping(value ="{id}")
	public void delete(@PathVariable("id") int id)
	{
		bookServices.delete(id);
	}
	
	
	
	
	@CrossOrigin(origins = "*") 
	@GetMapping
	public ResponseEntity<Set<Book>> getList()
	{
		Set<Book> list = bookServices.getList();
		return new ResponseEntity<Set<Book>>(list,HttpStatus.OK);
	}
	
	@CrossOrigin(origins = "*") 
	@GetMapping(value ="findByAuthor")
	public List<Book> findByAuthor(@RequestParam("pageNumber") int pageNumber, @RequestParam("pageSize") int pageSize, @RequestParam("author") String author )
	{
		List<Book> list = bookServices.getBookByAuthor(pageNumber,pageSize,author);
		return list;
	}
	
	
	@CrossOrigin(origins = "*") 
	@GetMapping(value ="findByPublisher")
	public List<Book> findByPublisher(@RequestParam("pageNumber") int pageNumber, @RequestParam("pageSize") int pageSize, @RequestParam("publisher") String publisher )
	{
		List<Book> list = bookServices.getBookByPublisher(pageNumber,pageSize,publisher);
		return list;
	}
	
	
	@CrossOrigin(origins = "*") 
	@GetMapping(value ="findByTitle")
	public List<Book> findByTitle(@RequestParam("pageNumber") int pageNumber, @RequestParam("pageSize") int pageSize, @RequestParam("title") String title )
	{
		List<Book> list = bookServices.getBookByTitle(pageNumber,pageSize,title);
		return list;
	}
	
	
	
	@CrossOrigin(origins = "*") 
	@GetMapping(value ="findByCategories")
	public List<Book> findByCategories(@RequestParam("pageNumber") int pageNumber, @RequestParam("pageSize") int pageSize, @RequestParam("categories") String categories )
	{
		List<Book> list = bookServices.getBookByCategories(pageNumber,pageSize,categories);
		return list;
	}
	
	
	@CrossOrigin(origins = "*") 
	@GetMapping(value ="findByEdition")
	public List<Book> findByEdition(@RequestParam("pageNumber") int pageNumber, @RequestParam("pageSize") int pageSize, @RequestParam("edition") int edition )
	{
		List<Book> list = bookServices.getBookByEdition(pageNumber,pageSize,edition);
		return list;
	}
	
	
	@CrossOrigin(origins = "*") 
	@GetMapping(value ="findByPage")
	public List<Book> viewBooks(@RequestParam("pageNumber") int pageNumber, @RequestParam("pageSize") int pageSize)
	{
		List<Book> list = bookServices.getPage(pageNumber,pageSize);
		return list;
	}
	
	
	
}
