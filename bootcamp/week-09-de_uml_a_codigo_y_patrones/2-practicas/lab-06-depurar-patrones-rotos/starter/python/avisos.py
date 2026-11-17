from abc import ABC, abstractmethod
from datetime import datetime


class Seat:
    def __init__(self, row: str, number: int):
        self._row = row
        self._number = number


class ScreeningObserver(ABC):
    @abstractmethod
    def seat_released(self, screening: "Screening", seat: Seat) -> None: ...


class Screening:
    def __init__(self, starts_at: datetime):
        self._starts_at = starts_at
        self._observers: list[ScreeningObserver] = []

    def attach(self, observer: ScreeningObserver) -> None:
        self._observers.append(observer)

    def detach(self, observer: ScreeningObserver) -> None:
        self._observers.remove(observer)

    def release_seat(self, seat: Seat) -> None:
        for observer in self._observers:
            observer.seat_released(self, seat)


class WaitingList(ScreeningObserver):
    def seat_released(self, screening: Screening, seat: Seat) -> None:
        raise NotImplementedError


class BoxOfficeDisplay:
    def seat_released(self, screening: Screening, seat: Seat) -> None:
        raise NotImplementedError


class SmsAlert(ScreeningObserver):
    def seat_released(self, screening: Screening, seat: Seat) -> None:
        raise NotImplementedError
