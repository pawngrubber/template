import numpy as np


def np_maximum(x, y):
    return np.maximum(x, y)


def np_arange(x):
    return np.arange(x)


def test_np_maximum():
    x = 3
    y = 5
    assert np_maximum(x, y) == y


def test_np_arange():
    x = 5
    assert len(np_arange(5)) == x


if __name__ == "__main__":
    pass
