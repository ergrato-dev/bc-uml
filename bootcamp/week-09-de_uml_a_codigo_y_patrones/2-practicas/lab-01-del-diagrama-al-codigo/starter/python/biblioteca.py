from abc import ABC, abstractmethod
from datetime import date
from enum import Enum


class LoanStatus(Enum):
    ACTIVE = "active"
    RETURNED = "returned"


class LibraryItem(ABC):
    def __init__(self, title: str):
        self._title = title

    @abstractmethod
    def loan_days(self) -> int: ...


class Book(LibraryItem):
    def __init__(self, title: str, isbn: str):
        super().__init__(title)
        self._isbn = isbn

    def loan_days(self) -> int:
        return 21


# TODO 1: escribe la clase Dvd a partir de Book.
# TODO 2: escribe la clase Loan con sus atributos y su asociación; añade aquí los atributos
#         de Member y la colección de préstamos.
# TODO 3: escribe las operaciones de Member y de Loan.
class Member:
    pass
