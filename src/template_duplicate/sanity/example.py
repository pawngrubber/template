import numpy as np  # type: ignore[import]
import numbers


def arange(numbers: int) -> np.array:
    return np.arange(numbers)


def add(val_one: numbers.Number, val_two: numbers.Number) -> numbers.Number:
    return val_one + val_two


def upper(text: str) -> str:
    return text.upper()
