public class Book extends LibraryItem {
    private String isbn;

    @Override
    public int loanDays() {
        return 21;
    }
}
