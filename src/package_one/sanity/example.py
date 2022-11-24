import numpy as np
import numpy.typing


def caleb(number: int):
    if number == 5:
        print("Test 1")
    if number == 4:
        print("Test 2")
    print("Testing precommit")


def arange(number: int) -> np.typing.ArrayLike:
    return np.arange(number)


def add(val_one: float, val_two: float) -> float:
    return val_one + val_two


def upper(text: str) -> str:
    return text.upper()
