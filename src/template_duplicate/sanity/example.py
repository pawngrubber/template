import numpy as np  # type: ignore[import]
import number


def arange(number: int) -> np.array:
    return np.arange(number)


def add(val_one: number.Number, val_two: number.Number) -> number.Number:
    return val_one + val_two


def upper(text: str) -> str:
    return text.upper()
