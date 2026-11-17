import java.math.BigDecimal;

public interface DiscountRule {
    BigDecimal apply(BigDecimal amount);
}
