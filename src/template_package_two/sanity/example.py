import numpy as np
import numpy.typing


def arange(number: int) -> numpy.typing.NDArray[np.int_]:
    return np.arange(number)


def add(val_one: float, val_two: float) -> float:
    return val_one + val_two


def upper(text: str) -> str:
    return text.upper()
