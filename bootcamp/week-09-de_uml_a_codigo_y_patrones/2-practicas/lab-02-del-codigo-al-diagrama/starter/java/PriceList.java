import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

public class PriceList {
    private final Map<String, BigDecimal> pricesBySku = new HashMap<>();

    public BigDecimal priceOf(Product product) {
        return pricesBySku.getOrDefault(product.getSku(), BigDecimal.ZERO);
    }
}
