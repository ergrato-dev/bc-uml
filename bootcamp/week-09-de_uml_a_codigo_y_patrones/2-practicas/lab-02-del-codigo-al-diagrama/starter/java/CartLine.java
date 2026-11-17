import java.math.BigDecimal;

public class CartLine {
    private final Product product;
    private int quantity;

    CartLine(Product product, int quantity) {
        this.product = product;
        this.quantity = quantity;
    }

    public BigDecimal subtotal(PriceList prices) {
        return prices.priceOf(product).multiply(BigDecimal.valueOf(quantity));
    }
}
