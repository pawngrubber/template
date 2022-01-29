import numpy as np  # type: ignore[import]


def np_maximum(val_x, val_y):
    return np.maximum(val_x, val_y)


def np_arange(val_x):
    return np.arange(val_x)


def test_np_maximum():
    val_x = 3
    val_y = 5
    assert np_maximum(val_x, val_y) == val_y


def test_np_arange():
    val_x = 5
    assert len(np_arange(5)) == val_x


if __name__ == "__main__":
    pass
