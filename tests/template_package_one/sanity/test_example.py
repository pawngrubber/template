import pytest

from template import sanity


# The real sanity test
def test_truth() -> None:
    assert True


# Examples of a few simple tests
def test_arange() -> None:
    val_x = 5
    arange = sanity.example.arange(val_x)
    assert len(arange) == val_x


def test_add_one() -> None:
    assert sanity.example.add(5, 1) == 6


def test_upper() -> None:
    assert sanity.example.upper("foo") == "FOO"


# Example raising an exception
RAISES_CONSTANT = "some info"


def raises() -> None:
    raise Exception(RAISES_CONSTANT)


def test_raises() -> None:
    with pytest.raises(Exception) as e:
        raises()
    assert e.value.args[0] == RAISES_CONSTANT


# Complex example demonstrating classes, scopes, and fixtures
@pytest.fixture
def val_one() -> int:
    return 5


@pytest.fixture
def echo_val_two(val_two: int) -> int:
    return val_two


class BaseAdd:
    def test_add(self, val_one: int, echo_val_two: int) -> None:
        assert sanity.example.add(val_one, echo_val_two) == val_one + echo_val_two


class TestAddThree(BaseAdd):
    @pytest.fixture
    def val_two(self) -> int:
        return 3


class TestAddFour(BaseAdd):
    @pytest.fixture
    def val_two(self) -> int:
        return 4


if __name__ == "__main__":
    pass
