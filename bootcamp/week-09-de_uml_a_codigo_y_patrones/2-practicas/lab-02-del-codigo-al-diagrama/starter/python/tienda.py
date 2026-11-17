from abc import ABC, abstractmethod
from datetime import date
from decimal import Decimal


class Customer:
    def __init__(self, name: str, email: str):
        self._name = name
        self._email = email

    @property
    def email(self) -> str:
        return self._email


class Product:
    def __init__(self, sku: str, name: str):
        self._sku = sku
        self._name = name

    @property
    def sku(self) -> str:
        return self._sku


class PriceList:
    def __init__(self):
        self._prices_by_sku: dict[str, Decimal] = {}

    def price_of(self, product: Product) -> Decimal:
        return self._prices_by_sku.get(product.sku, Decimal(0))


class CartLine:
    def __init__(self, product: Product, quantity: int):
        self._product = product
        self._quantity = quantity

    def subtotal(self, prices: PriceList) -> Decimal:
        return prices.price_of(self._product) * self._quantity


class DiscountRule(ABC):
    @abstractmethod
    def apply(self, amount: Decimal) -> Decimal: ...


class SeasonalDiscount(DiscountRule):
    def __init__(self, percentage: Decimal, ends_on: date):
        self._percentage = percentage
        self._ends_on = ends_on

    def apply(self, amount: Decimal) -> Decimal:
        return amount - amount * self._percentage / 100


class Cart:
    def __init__(self, customer: Customer):
        self._customer = customer
        self._lines: list[CartLine] = []
        self._discount: DiscountRule | None = None

    def add(self, product: Product, quantity: int) -> None:
        self._lines.append(CartLine(product, quantity))

    def apply_discount(self, discount: DiscountRule) -> None:
        self._discount = discount

    def total(self, prices: PriceList) -> Decimal:
        total = sum((line.subtotal(prices) for line in self._lines), Decimal(0))
        return self._discount.apply(total) if self._discount else total

    @property
    def lines(self) -> list[CartLine]:
        return list(self._lines)

    @property
    def customer(self) -> Customer:
        return self._customer
