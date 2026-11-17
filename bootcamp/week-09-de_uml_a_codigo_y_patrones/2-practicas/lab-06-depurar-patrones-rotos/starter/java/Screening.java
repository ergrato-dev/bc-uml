import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class Screening {
    private LocalDateTime startsAt;
    private final List<ScreeningObserver> observers = new ArrayList<>();

    public void attach(ScreeningObserver observer) {
        observers.add(observer);
    }

    public void detach(ScreeningObserver observer) {
        observers.remove(observer);
    }

    public void releaseSeat(Seat seat) {
        for (ScreeningObserver observer : observers) {
            observer.seatReleased(this, seat);
        }
    }
}
