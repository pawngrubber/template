from template_duplicate import example

def test_arange():
    x = 5
    assert len(example.arange(5)) == x

def test_add_one():
    assert example.add_one(5) == 6

if __name__ == "__main__":
    pass
