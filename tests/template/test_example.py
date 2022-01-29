from template import example


def test_arange():
    val_x = 5
    assert len(example.arange(5)) == val_x


def test_add_one():
    assert example.add_one(5) == 6


if __name__ == "__main__":
    pass
