from datetime import datetime

from libqtile.widget import base


class Javatime(base.InLoopPollText):
    """Display time with java market day"""

    defaults = [
            ("format", "%a %d %b %H:%M %p", "Datetime format in python"),
            ("update_interval", 0.5, "Update time in second")
        ]

    def __init__(self, **config):
        base.InLoopPollText.__init__(self, **config)
        self.add_defaults(Javatime.defaults)

    def poll(self):
        today = datetime.today()
        java_day = today.day

        pancarwara_day = (java_day + 4 ) % 5

        market_day_name = ["Pon", "Wage", "Kliwon", "Legi", "Paing"]

        dt = datetime.now()

        now = dt.strftime(self.format)

        datenow = f"{market_day_name[pancarwara_day]}, {now}"

        return datenow
