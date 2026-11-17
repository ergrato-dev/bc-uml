import java.math.BigDecimal;
import java.time.LocalDate;

public class SeasonalDiscount implements DiscountRule {
    private BigDecimal percentage;
    private LocalDate endsOn;

    public SeasonalDiscount(BigDecimal percentage, LocalDate endsOn) {
        this.percentage = percentage;
        this.endsOn = endsOn;
    }

    @Override
    public BigDecimal apply(BigDecimal amount) {
        return amount.subtract(amount.multiply(percentage).divide(BigDecimal.valueOf(100)));
    }
}
