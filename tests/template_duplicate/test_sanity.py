import pytest


def upper(foo):
    return foo.upper()


def increment(foo):
    return foo + 1


def raises():
    raise Exception


def test_base():
    assert True is True


def test_upper():
    assert upper("foo") == "FOO"


def test_increment():
    assert increment(10) == 12


def test_raises():
    with pytest.raises(Exception):
        raises()


if __name__ == "__main__":
    pass
