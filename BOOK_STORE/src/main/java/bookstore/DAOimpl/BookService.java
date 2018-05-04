package bookstore.DAOimpl;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import bookstore.DAO.BookRepository;
import bookstore.Model.Book;

@Service
@Transactional
public class BookService {

	
	@Autowired
	BookRepository bookRepository;
	
	private final static int PAGESIZE = 10;
	
	public void create (String author, String categories, String description, int edition, int pages, int price, Date pubdate, String publisher, String title)
	{
		Book book = new Book();
		book.setAuthor(author);
		book.setCategories(categories);
		book.setDescription(description);
		book.setEdition(edition);
		book.setPages(pages);
		book.setPrice(price);
		book.setPubdate(pubdate);
		book.setPublisher(publisher);
		book.setTitle(title);
		bookRepository.save(book);
	}
	
		
	
	public void update(Book book)
	{
		bookRepository.saveAndFlush(book);
	}
	
	
	public void delete(int id)
	{
		bookRepository.deleteById(id);
	}
	
	public Set<Book> getList()
	{
		Set<Book> list = new HashSet<Book>();
		for(Book book: bookRepository.findAll())
		{
			 list.add(book);
		}
		return list;
	}
	
	public Book get(int id)
	{
		Book book = bookRepository.getOne(id);
		return book;
	}
	
	
	public List<Book> getPage(int pageNumber,int pageSize)
	{
		PageRequest request = new PageRequest(pageNumber - 1, pageSize, Sort.Direction.ASC, "idbook");			
		return bookRepository.findAll(request).getContent();
	}
	
	public List<Book> getBookByEdition(int pageNumber, int pageSize, int edition)
	{
		PageRequest request = new PageRequest(pageNumber - 1, pageSize, Sort.Direction.ASC, "idbook");			
		return bookRepository.findByEdition(edition, request).getContent();
	}
	
	public List<Book> getBookByAuthor(int pageNumber, int pageSize, String author)
	{
		PageRequest request = new PageRequest(pageNumber - 1, pageSize, Sort.Direction.ASC, "idbook");			
		return bookRepository.findByAuthor(author, request).getContent();
	}
	
	
	public List<Book> getBookByPublisher(int pageNumber, int pageSize, String publisher)
	{
		PageRequest request = new PageRequest(pageNumber - 1, pageSize, Sort.Direction.ASC, "idbook");			
		return bookRepository.findByPublisher(publisher, request).getContent();
	}
	
	public List<Book> getBookByTitle(int pageNumber, int pageSize, String title)
	{
		PageRequest request = new PageRequest(pageNumber - 1, pageSize, Sort.Direction.ASC, "idbook");			
		return bookRepository.findByTitle(title, request).getContent();
	}
	
	public List<Book> getBookByCategories(int pageNumber, int pageSize, String categories)
	{
		PageRequest request = new PageRequest(pageNumber - 1, pageSize, Sort.Direction.ASC, "idbook");			
		return bookRepository.findByCategories(categories, request).getContent();
	}
	
	

	
	
	
	
	
	
}
