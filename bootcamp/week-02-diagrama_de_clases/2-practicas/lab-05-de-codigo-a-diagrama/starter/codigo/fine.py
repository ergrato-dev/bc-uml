from abc import ABC, abstractmethod
from decimal import Decimal


class Fine(ABC):
    """Multa por un préstamo devuelto tarde."""

    DAILY_CAP = Decimal("5.00")

    def __init__(self, loan_id: str, days_overdue: int) -> None:
        self._loan_id = loan_id
        self._days_overdue = days_overdue
        self._paid = False

    @abstractmethod
    def amount(self) -> Decimal:
        ...

    def pay(self) -> None:
        self._paid = True

    def is_paid(self) -> bool:
        return self._paid


class StandardFine(Fine):
    def amount(self) -> Decimal:
        return min(Decimal("0.50") * self._days_overdue, self.DAILY_CAP * self._days_overdue)
