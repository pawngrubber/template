import pytest  # type: ignore[import]


def upper(val_x):
    return val_x.upper()


def increment(val_x):
    return val_x + 1


def raises():
    raise Exception


def test_base():
    assert True is True


def test_upper():
    assert upper("foo") == "FOO"


def test_increment():
    assert increment(10) == 11


def test_raises():
    with pytest.raises(Exception):
        raises()


if __name__ == "__main__":
    pass
