import pytest

from package_two import sanity


# The real sanity test
def test_truth():
    assert True


# Examples of a few simple tests
def test_arange():
    val_x = 5
    arange = sanity.example.arange(val_x)
    assert len(arange) == val_x


def test_add_one():
    assert sanity.example.add(5, 1) == 6


def test_upper():
    assert sanity.example.upper("foo") == "FOO"


# Example raising an exception
RAISES_CONSTANT = "some info"


def raises():
    raise Exception(RAISES_CONSTANT)


def test_raises():
    with pytest.raises(Exception) as e:
        raises()
    assert e.value.args[0] == RAISES_CONSTANT


# Complex example demonstrating classes, scopes, and fixtures
@pytest.fixture
def val_one():
    return 5


@pytest.fixture
def echo_val_two(val_two):
    return val_two


class BaseAdd:
    def test_add(self, val_one, echo_val_two):
        assert sanity.example.add(val_one, echo_val_two) == val_one + echo_val_two


class TestAddThree(BaseAdd):
    @pytest.fixture
    def val_two(self):
        return 3


class TestAddFour(BaseAdd):
    @pytest.fixture
    def val_two(self):
        return 4


if __name__ == "__main__":
    pass
