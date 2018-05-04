package bookstore.DAO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import bookstore.Model.Book;

public interface BookRepository extends JpaRepository<Book, Integer> {
	
	Page<Book> findByAuthor(String author, Pageable page);
	Page<Book> findByEdition(int edition, Pageable page);
	Page<Book> findByPublisher(String publisher, Pageable page);
	Page<Book> findByTitle(String title, Pageable page);
	Page<Book> findByCategories(String categories, Pageable page);

}
