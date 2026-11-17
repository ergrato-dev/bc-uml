import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class Cart {
    private final Customer customer;
    private final List<CartLine> lines = new ArrayList<>();
    private DiscountRule discount;

    public Cart(Customer customer) {
        this.customer = customer;
    }

    public void add(Product product, int quantity) {
        lines.add(new CartLine(product, quantity));
    }

    public void applyDiscount(DiscountRule discount) {
        this.discount = discount;
    }

    public BigDecimal total(PriceList prices) {
        BigDecimal sum = BigDecimal.ZERO;
        for (CartLine line : lines) {
            sum = sum.add(line.subtotal(prices));
        }
        return discount == null ? sum : discount.apply(sum);
    }

    public List<CartLine> getLines() {
        return List.copyOf(lines);
    }

    public Customer getCustomer() {
        return customer;
    }
}
