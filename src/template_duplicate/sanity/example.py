import numbers

import numpy as np  # type: ignore[import]


def arange(number: int) -> np.typing.ArrayLike:
    return np.arange(number)


def add(val_one: float, val_two: float) -> float:
    return val_one + val_two


def upper(text: str) -> str:
    return text.upper()
