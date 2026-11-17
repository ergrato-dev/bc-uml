package library;

import java.time.LocalDate;
import java.util.UUID;

public class Loan {
    private static final int MAX_RENEWALS = 2;

    private final UUID id;
    private final LocalDate startDate;
    private LocalDate dueDate;
    private int renewals;
    private LoanStatus status;

    public Loan(LocalDate startDate, LocalDate dueDate) {
        this.id = UUID.randomUUID();
        this.startDate = startDate;
        this.dueDate = dueDate;
        this.status = LoanStatus.ACTIVE;
    }

    public boolean renew(int extraDays) {
        if (renewals >= MAX_RENEWALS || status != LoanStatus.ACTIVE) {
            return false;
        }
        dueDate = dueDate.plusDays(extraDays);
        renewals++;
        return true;
    }

    public long daysOverdue(LocalDate today) {
        return Math.max(0, today.toEpochDay() - dueDate.toEpochDay());
    }

    public void close() {
        status = LoanStatus.RETURNED;
    }

    protected boolean isRenewable() {
        return renewals < MAX_RENEWALS;
    }

    public LocalDate getDueDate() {
        return dueDate;
    }
}

enum LoanStatus { ACTIVE, OVERDUE, RETURNED }
