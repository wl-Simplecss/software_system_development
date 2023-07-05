package com.book.web;

import com.book.domain.Book;
import com.book.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

@Controller
public class BookController {
    private BookService bookService;

    @Autowired
    public void setBookService(BookService bookService) {
        this.bookService = bookService;
    }

    @RequestMapping("/querybook.html")
    public ModelAndView queryBookDo(HttpServletRequest request,String searchWord){
        searchWord = new String(searchWord.getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
        System.out.println("book Name: "+searchWord);
        boolean exist=bookService.matchBook(searchWord);
        if (exist){
            List<Book> books = bookService.queryBook(searchWord);
            ModelAndView modelAndView = new ModelAndView("admin_books");
            modelAndView.addObject("books",books);
            return modelAndView;
        }
        else{
            return new ModelAndView("admin_books","error","没有匹配的图书");
        }
    }

    @RequestMapping("/reader_querybook_do.html")
    public String readerQueryBookDo(HttpServletRequest request,String searchWord,RedirectAttributes redirectAttributes){
        searchWord = new String(searchWord.getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
        boolean exist=bookService.matchBook(searchWord);

        if (exist){
            List<Book> books = bookService.queryBook(searchWord);
            redirectAttributes.addFlashAttribute("books", books);
            return "redirect:/reader_querybook.html";
        }
        else{
            redirectAttributes.addFlashAttribute("error", "没有匹配的图书！");
            return "redirect:/reader_querybook.html";
        }

    }
    @RequestMapping("/reader_querybook.html")
    public ModelAndView readerQueryBook(){
       return new ModelAndView("reader_book_query");

    }


    @RequestMapping("/allbooks.html")
    public ModelAndView allBook(){
        ArrayList<Book> books=bookService.getAllBooks();
        ModelAndView modelAndView=new ModelAndView("admin_books");
        modelAndView.addObject("books",books);
        return modelAndView;
    }


    @RequestMapping("/reader_allbook.html")
    public ModelAndView readerallBook(){
        ArrayList<Book> books=bookService.getAllBooks();
        ModelAndView modelAndView=new ModelAndView("reader_books");
        modelAndView.addObject("books",books);
        return modelAndView;
    }








    @RequestMapping("/deletebook.html")
    public String deleteBook(HttpServletRequest request,RedirectAttributes redirectAttributes){
        long bookId=Integer.parseInt(request.getParameter("bookId"));
        int res=bookService.deleteBook(bookId);

        if (res==1){
            redirectAttributes.addFlashAttribute("succ", "图书删除成功！");
            return "redirect:/allbooks.html";
        }else {
            redirectAttributes.addFlashAttribute("error", "图书删除失败！");
            return "redirect:/allbooks.html";
        }
    }

    @RequestMapping("/book_add.html")
    public ModelAndView addBook(HttpServletRequest request){

            return new ModelAndView("admin_book_add");

    }

    @RequestMapping("/book_add_do.html" )
    public String addBookDo(BookAddCom bookAddCom, RedirectAttributes redirectAttributes){
        Book book=new Book();
        book.setBookId(0);
        book.setPrice(bookAddCom.getPrice());
        book.setState(bookAddCom.getState());
        book.setPublish(bookAddCom.getPublish());
        book.setPubdate(bookAddCom.getPubdate());
        book.setName(bookAddCom.getName());
        book.setIsbn(bookAddCom.getIsbn());
        book.setClassId(bookAddCom.getClassId());
        book.setAuthor(bookAddCom.getAuthor());
        book.setIntroduction(bookAddCom.getIntroduction());
        book.setPressmark(bookAddCom.getPressmark());
        book.setLanguage(bookAddCom.getLanguage());

        System.out.println("AddBookD0 "+ bookAddCom.getName()+ bookAddCom.getAuthor()+ bookAddCom.getPubdate());
        boolean succ=bookService.addBook(book);
        ArrayList<Book> books=bookService.getAllBooks();
        if (succ){
            redirectAttributes.addFlashAttribute("succ", "图书添加成功！");
            return "redirect:/allbooks.html";
        }
        else {
            redirectAttributes.addFlashAttribute("succ", "图书添加失败！");
            return "redirect:/allbooks.html";
        }
    }

    @RequestMapping("/updatebook.html")
    public ModelAndView bookEdit(HttpServletRequest request){
        long bookId=Integer.parseInt(request.getParameter("bookId"));
        Book book=bookService.getBook(bookId);
        ModelAndView modelAndView=new ModelAndView("admin_book_edit");
        modelAndView.addObject("detail",book);
        return modelAndView;
    }

    @RequestMapping("/book_edit_do.html")
    public String bookEditDo(HttpServletRequest request, BookAddCom bookAddCom, RedirectAttributes redirectAttributes){
        long bookId=Integer.parseInt( request.getParameter("id"));
        String Publish = new String(bookAddCom.getPublish().getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
        String Name = new String(bookAddCom.getName().getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
        String Author = new String(bookAddCom.getAuthor().getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
        String Introduction= new String(bookAddCom.getIntroduction().getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
        String Language = new String(bookAddCom.getLanguage().getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);

        Book book=new Book();
        book.setBookId(bookId);
        book.setPrice(bookAddCom.getPrice());
        book.setState(bookAddCom.getState());
        book.setPublish(Publish);
        book.setPubdate(bookAddCom.getPubdate());
        book.setName(Name);
        book.setIsbn(bookAddCom.getIsbn());
        book.setClassId(bookAddCom.getClassId());
        book.setAuthor(Author);
        book.setIntroduction(Introduction);
        book.setPressmark(bookAddCom.getPressmark());
        book.setLanguage(Language);


        boolean succ=bookService.editBook(book);
        if (succ){
            redirectAttributes.addFlashAttribute("succ", "图书修改成功！");
            return "redirect:/allbooks.html";
        }
        else {
            redirectAttributes.addFlashAttribute("error", "图书修改失败！");
            return "redirect:/allbooks.html";
        }
    }


    @RequestMapping("/bookdetail.html")
    public ModelAndView bookDetail(HttpServletRequest request){
        long bookId=Integer.parseInt(request.getParameter("bookId"));
        Book book=bookService.getBook(bookId);
        ModelAndView modelAndView=new ModelAndView("admin_book_detail");
        modelAndView.addObject("detail",book);
        return modelAndView;
    }



    @RequestMapping("/readerbookdetail.html")
    public ModelAndView readerBookDetail(HttpServletRequest request){
        long bookId=Integer.parseInt(request.getParameter("bookId"));
        Book book=bookService.getBook(bookId);
        ModelAndView modelAndView=new ModelAndView("reader_book_detail");
        modelAndView.addObject("detail",book);
        return modelAndView;
    }



}
